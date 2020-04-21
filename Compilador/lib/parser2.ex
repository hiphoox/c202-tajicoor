defmodule Parser2 do
  @moduledoc """
  Documentation for `Parser2`.
  """

  @doc """
  Modulo para manejar el Parser

  ## Examples

      #iex> Parser.holaMundo()
      #"Parser // Funcion incompleta"

  require Regex
  require Enum
  """
  def main(tokens) do
    #El programa solo acepta directivas y declaraciones con (o sin) asignacion de variables y funciones
    ast = principal(tokens,[])
    #IO.puts "Termino de generar el ast"
    ast
  end

  def principal(tokens,lista) do
    if Enum.count(tokens)>=1 do
      [head|_tail] = tokens
      case identificador(head[:content]) do
        :directiva -> 
          case directiva(tokens) do
            {:ok,elemDirectiva,tokensRestantes} ->
              principal(tokensRestantes,lista++[elemDirectiva])
            {:error,mensajeError,tok} ->
              [{:error,mensajeError,tok}]
          end
        :tipoDato ->
          case declFuncion(tokens) do
            {:error,mensaje,tok} -> [{:error,mensaje,tok}]
            {funcion,tokensRestantes} ->
              lista = lista++[funcion]
              principal(tokensRestantes,lista)
          end
        _ ->
          lista++[{:error,"Unexpected token '#{head[:content]}'",head}]
      end
    else
      lista
    end
  end

  def directiva([head1|[head2|tail2]]) do #Checa que tenga al menos dos elementos
    if identificador(head1[:content])==:directiva and identificador(head2[:content])==:idDirectiva do
      {:ok,{:directiva,:include,hd Regex.run(~r/"?[[:alnum:]\.]+"?/,head2[:content])},tail2}
    else
      {:error,"Error in directive syntax '#{head1[:content]}' '#{head2[:content]}'",head1}
    end
  end
  def directiva(_) do #Captura error en sintaxis
    {:error,"Error, ended before expected",nil}
  end

  def declFuncion(tokens) do
    if Enum.count(tokens)>=4 do
      [aux1|[aux2|[aux3|resto]]] = tokens
      if identificador(aux1[:content])==:tipoDato and (identificador(aux2[:content])==:id or aux2[:content]=="main") and aux3[:content]=="\(" do
        declaraciones=parametros([aux3|resto],[])
        case declaraciones do
          {:error, mensaje,token} -> {:error, mensaje<>" in function '#{aux2[:content]}'",token}
          {listaParam,restoTokens} ->
            tokens = restoTokens
            if Enum.count(tokens)>=1 do
              case (hd tokens)[:content] do
                "\{" -> 
                  #{listaStatements,tokens} = statements(tokens,[]) #Aqui me quede
                  #{{:function,aux1,aux2,listaParam,listaStatements},}
                  case statements(tokens,[]) do
                    {:error,mensaje,token} -> {:error,mensaje<>" in '#{aux2[:content]}' function",token}
                    {listaStatements,tokens} -> {{:function,aux1,aux2,listaParam,listaStatements},tokens}
                    _ ->
                      #IO.puts inesperado 
                      {:error,"Unexpected error in statements of function '#{aux2[:content]}'",nil}
                  end
                ";" -> 
                  [_aux|tokens] = tokens
                  {{:function,aux1,aux2,listaParam,[]},tokens}
                _ -> {:error, "Unexpected function token. Expected ';' or '\{'. In function '#{aux2[:content]}'",(hd tokens)}
              end
            end
          _ -> {:error, "Unexpected error in function '#{aux2[:content]}'",nil}
        end
      else
        {:error, "Error in function syntax, expected type name ( [...], got '#{aux1[:content]}' '#{aux2[:content]}' '#{aux3[:content]}' [...]",aux1}
      end
    else
      {:error,"Function ended before expected",nil}
    end
  end

  def statements(tokens,lista) do
    #IO.puts "Entro a statements"
    #IO.puts tokens
    if (tokens != []) do

      if (((hd tokens)[:content] == "\{") and Enum.count(lista)==0) do
        [_aux|tokens]=tokens
        statements(tokens,lista)
      else
        if (hd tokens)[:content] == "\}" do
          [_aux|resto]= tokens
          {lista,resto}
        else
          if Enum.count(tokens)>=1 do
            [aux|resto] = tokens
            case identificador(aux[:content]) do
              :tipoDato ->
                case declVariables(resto,lista,aux) do
                  {:error,mensaje,tok} -> {:error,mensaje,tok}
                  {nuevosElem,resto} -> 
                    lista = lista ++ nuevosElem
                    tokens = resto
                    statements(tokens,lista)
                  _ -> {:error,"Unexpected error in statements reading",nil}
                end
              :reser ->
                case aux[:content] do
                  "return" ->
                    case returnStatement(tokens) do
                      {:error,mensaje,tok} -> {:error,mensaje,tok}
                      {nuevoElem,resto} ->
                        lista = lista ++ [nuevoElem]
                        tokens = resto
                        statements(tokens,lista)
                    end
                  _ -> {:error,"Unrecognized statement : '#{aux[:content]}'",aux} #(implicit declaration?)
                end
              _ -> {:error, "Unrecognized statement : '#{aux[:content]}'",aux} #(implicit declaration?)
            end    
          else
              {:error,"Statements reading ended before expected",nil}
          end
        end
      end

    else
      {:error,"Statements block ended before expected",nil}
    end
  end

  def declVariables(tokens,lista,tipo) do
    #IO.puts "Entro a declaracion de variables"<>tipo<>"con:"
    #IO.puts tokens
    if ((identificador(hd tokens) == :tipoDato) and Enum.count(lista)==0 and (hd tokens)!="void") do
      [_aux|lista]=lista
      IO.puts lista
    end
    if (hd tokens) == ";" do
      [_aux|resto]= tokens
      {lista,resto}
    else
      if Enum.count(tokens)>=2 do
        [aux1|resto] = tokens
        if identificador(aux1)==:id do
          lista = lista++[{:declVar,aux1}]
          [aux2|resto] = resto
          case aux2 do
            "," -> declVariables(resto,lista,tipo)
            ";" -> declVariables([aux2|resto],lista,tipo)
            "=" ->
              expres = crearExpresion(resto)
              case expres do
                {:error,mensaje,tok} -> {:error,mensaje,tok}
                {auxExpres,resto} -> #Cambiar expresion por  {:expresion}
                  lista = lista++[{:assign,aux1,auxExpres}]

                  #En caso de querer hacer asignaciones contiguas int a=b=1+2;, por aqui se debe cambiar el
                  [aux1|resto] = resto
                  case aux1 do
                    "," -> declVariables(resto,lista,tipo)
                    ";" -> declVariables([aux1|resto],lista,tipo)
                    _ -> {:error,"In variable declaration (2), expected ',' or ';', got '#{aux1}'",aux1}
                  end
                _ -> {:error,"ERROR en la asignacion de valor a la variable declarada",nil}

              end
            _ -> {:error,"In variable declaration, expected ',', ';' or '=', got '#{aux1}'",aux1}
          end
        else
          {:error,"Invalid var name: #{aux1}",aux1}
        end
      else
          {:error,"Lectura de parametros termino antes de lo esperado",nil}
      end
    end
  end

  def crearExpresion(tokens) do
    #{lista,resto} = expresion(tokens,[],:expresion)
    #IO.puts lista

    case (expresion(tokens,[],:expresion)) do
      {:error,mensaje,tok} -> {:error,mensaje,tok}
      {lista,resto} ->




    #IO.puts lista
    #Aplica los operadores unarios
    {:operador,lista,_}=Enum.reduce(lista,{:expresion,[],nil}, fn sig,acc -> 
      {sigEsperado,lista2,opUnarios} = acc
      #IO.puts opUnarios
      if (sigEsperado==:expresion) do
        if opUnarios==nil do
          if is_map(sig) do
            {:expresion,lista2,[sig]}
          else
            lista2 = lista2++[sig]
            {:operador,lista2,nil}
          end
        else
          if is_map(sig) do
            {:expresion,lista2,[sig|opUnarios]}
          else
            sigAux = Enum.reduce(opUnarios,sig, fn op,acc -> 
              case op[:content] do
                "-" -> {:opUnario,"negation",acc}
                "~" -> {:opUnario,"bwComp",acc}
                "!" -> {:opUnario,"logNeg",acc}
              end
            end)
            #IO.puts sigAux
            lista2 = lista2++[sigAux]
            {:operador,lista2,nil}
          end

        end 
      else
        if is_map(sig) do
          if sig[:content] in ["+","-","*","/"] do
            lista2 = lista2++[sig]
            {:expresion,lista2,nil}
          else
            {:error, "Unexpected error creating expresion, expecting binary operator, got something else",nil}
          end
        else
          {:error, "Unexpected error creating expresion, expecting binary operator, got not even a map node",nil}
        end
      end
    end)
    
    #Aplica los operadores * y /
    {:operador,lista,_}=Enum.reduce(lista,{:expresion,[],nil}, fn sig,acc -> 
      {sigEsperado,lista2,operacion} = acc
      if (sigEsperado==:expresion) do
        if operacion==nil do
          lista2 = lista2++[sig]
          {:operador,lista2,nil}
        else
          {anterior,operador}=operacion
          case operador do
            "*" -> {:operador,lista2++[{:opBinario,"mult",anterior,sig}],nil}
            "/" -> {:operador,lista2++[{:opBinario,"div",anterior,sig}],nil}
          end
        end
      else
        if is_map(sig) do
          if sig[:content] in ["*","/"] do
            ultimoElem = List.last(lista2)
            lista2 = List.delete_at(lista2,(length lista2)-1)
            {:expresion,lista2,{ultimoElem,sig[:content]}}
          else
            lista2 = lista2++[sig]
            {:expresion,lista2,nil}
          end
        else
          lista2 = lista2++[sig]
          {:expresion,lista2,nil}
        end
      end
    end)
    
    #Aplica los operadores + y -
    {:operador,lista,_}=Enum.reduce(lista,{:expresion,[],nil}, fn sig,acc -> 
      {sigEsperado,lista2,operacion} = acc
      if (sigEsperado==:expresion) do
        if operacion==nil do
          lista2 = lista2++[sig]
          {:operador,lista2,nil}
        else
          {anterior,operador}=operacion
          case operador do
            "+" -> {:operador,lista2++[{:opBinario,"add",anterior,sig}],nil}
            "-" -> {:operador,lista2++[{:opBinario,"subs",sig,anterior}],nil}
          end
        end
      else
        if is_map(sig) do
          if sig[:content] in ["+","-"] do
            ultimoElem = List.last(lista2)
            lista2 = List.delete_at(lista2,(length lista2)-1)
            {:expresion,lista2,{ultimoElem,sig[:content]}}
          else
            {:operador,[{:error,"Unexpected error reading add and sub operators",nil}],nil}
          end
        else
          {:operador,[{:error,"Unexpected error reading add and sub operators",nil}],nil}
        end
      end
    end)

    {(hd lista),resto}


      _ ->
        {:error,"Unexpected error creating expresion",nil}
    end

  end

  def expresion(tokens,lista,sigEsperado) do ## 2; debe devolver el ; en la lista de tokens
    ##Falta validar la longitud de tokens
    [aux|resto] = tokens
    ##Cambiar todo el case para aceptar mas casos
    if sigEsperado==:expresion do
      case identificador(aux[:content]) do
        :cadena -> 
          lista = lista++[{:cadena,aux}]
          expresion(resto,lista,:operador)
        :id -> 
          lista = lista++[{:variable,aux}]
          expresion(resto,lista,:operador)
        :flotante -> 
          {valor,_rest} = Float.parse(aux[:content])
          lista = lista++[{:float,valor}]
          expresion(resto,lista,:operador)
        :int ->
          {valor,_rest} = Integer.parse(aux[:content])
          lista = lista++[{:int,valor}]
          expresion(resto,lista,:operador)
        _otro ->
          case aux[:content] do
            "-" ->
              lista = lista++[aux]
              expresion(resto,lista,:expresion)
            "~" ->
              lista = lista++[aux]
              expresion(resto,lista,:expresion)
            "!" ->
              lista = lista++[aux]
              expresion(resto,lista,:expresion)
            "(" ->
              case crearExpresion(resto) do
                {:error,mensaje,tok} ->
                  {:error, mensaje,tok}
                {elem,resto} ->
                  [sig|resto] = resto
                  if sig[:content]==")" do
                    lista = lista++[elem]
                    expresion(resto,lista,:operador)
                  else
                    {:error, " Expected ')', got instead '#{sig[:content]}'",sig}
                  end
                  
              end
            _ ->
              {:error, " Got unexpected token '#{aux[:content]}', missing expresion",aux} 
          end
      end
    else
      if aux[:content] in ["+","-","*","/"] do
        lista = lista ++ [aux]
        expresion(resto,lista,:expresion)
      else
        {lista,[aux|resto]}
      end
    end
  end

  def parametros(tokens,lista) do #Tipo (int a, char c, float d) do
    [aux|resto] = tokens
    if ((aux[:content] == "\(") and Enum.count(lista)==0) do
      parametros(resto,lista)
    else

      if (aux[:content] == "\)") do
        {lista,resto}
      else
        #IO.puts "Entro a else"
        if Enum.count(tokens)>=2 do
          [aux1|[aux2|resto]] = tokens
          if identificador(aux1[:content])==:tipoDato and aux1 != "void" and identificador(aux2[:content])==:id do
            [aux|resto]=resto
            case aux[:content] do
              "," -> parametros(resto,lista++[{:parametro,aux1,aux2}])
              "\)" -> parametros([aux|resto],lista++[{:parametro,aux1,aux2}])
              _ -> {:error,"Expected ')' or ',' instead got '#{aux[:content]}'",aux}
            end
          else
            {:error,"Invalid syntax in parameters declaration '#{aux1[:content]}'",aux1}
          end
        else
            {:error,"Lectura de parametros termino antes de lo esperado",nil}
        end
      end
    end
  end

  def returnStatement(tokens) do
    if Enum.count(tokens)>=2 do
      [_aux1|[aux|tokens]] = tokens
      if (aux[:content]==";") do
        {{:return,:empty},tokens}
      else
        case crearExpresion([aux|tokens]) do
          {:error,mensaje,tok} -> {:error,mensaje<>" in return statement",tok}
          {expr,tokens} -> 
            [aux|tokens] = tokens
            if (aux[:content]==";") do
              {{:return,expr},tokens}
            else
              {:error, "Unexpected token in return statement, expected ';', got '#{aux[:content]}'",aux}
            end
          _ -> {:error, "Unexpected error reading return statement",nil}
        end
      end
    else
      {:error, "Return statement ends before expected",nil}
    end
  end

  def identificador(elem) do
    cond do
      String.match?(elem,~r/^\".*\"$/) ->
        :cadena
      String.match?(elem,~r/^int|float|double|char|void$/) ->
        :tipoDato
      String.match?(elem,~r/^main|struct|break|if|else|long|switch|case|for|while|do|default|const|return$/) ->
        :reser
      String.match?(elem,~r/^\+|\-|\/|\*|\%|\!|\~$/) ->
        :operador
      String.match?(elem,~r/^[a-zA-Z][[:alnum:]]*$/) ->
        :id
      String.match?(elem,~r/^[0-9]+\.[0-9]+$/) ->
        :flotante
      String.match?(elem,~r/^[0-9]+$/) ->
        :int
      String.match?(elem,~r/^<"?[[:alnum:]\.]+"?>$/) ->
        :idDirectiva
      String.match?(elem,~r/^#include$/) ->
        :directiva
      true ->
        :unid
    end
  end

end
