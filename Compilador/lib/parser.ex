defmodule Parser do
  @moduledoc """
  Documentation for `Parser`.
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
    IO.puts "Termino de generar el ast"
    ast
  end

  def principal(tokens,lista) do
    if Enum.count(tokens)>=1 do
      [head|_tail] = tokens
      case identificador(head) do
        :directiva -> 
          case directiva(tokens) do
            {:ok,elemDirectiva,tokensRestantes} ->
              principal(tokensRestantes,lista++[elemDirectiva])
            {:error,mensajeError} ->
              [{:error,mensajeError}]
          end
        :tipoDato ->
          case declFuncion(tokens) do
            {:error,mensaje} -> [{:error,mensaje}]
            {funcion,tokensRestantes} ->
              lista = lista++[funcion]
              principal(tokensRestantes,lista)
          end
        _ ->
          lista++[{:sinReconocer,"El resto de los elementos no son reconocidos"}]
      end
    else
      lista
    end
  end

  def directiva([head1|[head2|tail2]]) do #Checa que tenga al menos dos elementos
    if identificador(head1)==:directiva and identificador(head2)==:idDirectiva do
      {:ok,{:directiva,:include,hd Regex.run(~r/"?[[:alnum:]\.]+"?/,head2)},tail2}
    else
      {:error,"Error en la sintaxis de directiva "<>head1<>" "<>head2}
    end
  end
  def directiva(_) do #Captura error en sintaxis
    {:error,"Error, termino antes de lo esperado"}
  end

  def declFuncion(tokens) do
    if Enum.count(tokens)>=4 do
      [aux1|[aux2|[aux3|resto]]] = tokens
      if identificador(aux1)==:tipoDato and (identificador(aux2)==:id or aux2=="main") and aux3=="\(" do
        declaraciones=parametros([aux3|resto],[])
        case declaraciones do
          {:error, mensaje} -> {:error, mensaje<>" in function "<>aux2}
          {listaParam,restoTokens} ->
            tokens = restoTokens
            if Enum.count(tokens)>=1 do
              case (hd tokens) do
                "\{" -> 
                  #{listaStatements,tokens} = statements(tokens,[]) #Aqui me quede
                  #{{:function,aux1,aux2,listaParam,listaStatements},}
                  case statements(tokens,[]) do
                    {:error,mensaje} -> {:error,mensaje<>" en la funcion "<>aux2}
                    {listaStatements,tokens} -> {{:function,aux1,aux2,listaParam,listaStatements},tokens}
                    inesperado ->
                      IO.puts inesperado 
                      {:error,"Unexpected error in statements of function "<>aux2}
                  end
                ";" -> 
                  [_aux|tokens] = tokens
                  {{:function,aux1,aux2,listaParam,[]},tokens}
                _ -> {:error, "Unexpected function token. Expected ; or \{. In function "<>aux2}
              end
            end
          _ -> {:error, "Unexpected error in function "<>aux2}
        end
      else
        {:error, "Error in function syntax, expected type name ( [...], got "<>aux1<>" "<>aux2<>" "<>aux3<>" [...]"}
      end
    else
      {:error,"Error, funcion termino antes de lo esperado"}
    end
  end

  def statements(tokens,lista) do
    #IO.puts "Entro a statements"
    #IO.puts tokens
    if (((hd tokens) == "\{") and Enum.count(lista)==0) do
      [_aux|tokens]=tokens
      statements(tokens,lista)
    else
      #IO.puts "Leyendo statements"
      if (hd tokens) == "\}" do
        [_aux|resto]= tokens
        {lista,resto}
      else
        if Enum.count(tokens)>=1 do
          [aux|resto] = tokens
          case identificador(aux) do
            :tipoDato ->
              case declVariables(resto,lista,aux) do
                {:error,mensaje} -> {:error,mensaje}
                {nuevosElem,resto} -> 
                  lista = lista ++ nuevosElem
                  tokens = resto
                  statements(tokens,lista)
                _ -> {:error,"Unexpected error in statements reading"}
              end
            :reser ->
              case aux do
                "return" ->
                  case returnStatement(tokens) do
                    {:error,mensaje} -> {:error,mensaje}
                    {nuevoElem,resto} ->
                      lista = lista ++ [nuevoElem]
                      tokens = resto
                      statements(tokens,lista)
                  end
                _ -> {:error,"Unrecognized statement: "<>aux}
              end
            _ -> {:error, "Unrecognized statement: "<>aux}
          end    
        else
            {:error,"Lectura de statements termino antes de lo esperado"}
        end
      end
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
                {:error,mensaje} -> {:error,mensaje}
                {auxExpres,resto} -> #Cambiar expresion por  {:expresion}
                  lista = lista++[{:assign,aux1,auxExpres}]

                  #En caso de querer hacer asignaciones contiguas int a=b=1+2;, por aqui se debe cambiar el
                  [aux1|resto] = resto
                  case aux1 do
                    "," -> declVariables(resto,lista,tipo)
                    ";" -> declVariables([aux1|resto],lista,tipo)
                    _ -> {:error,"In variable declaration (2), expected ',' or ';', got "<>aux1}
                  end
                _ -> {:error,"ERROR en la asignacion de valor a la variable declarada"}

              end
            _ -> {:error,"In variable declaration, expected ',', ';' or '=', got "<>aux1}
          end
        else
          {:error,"Invalid var name: "<>aux1}
        end
      else
          {:error,"Lectura de parametros termino antes de lo esperado"}
      end
    end
  end

  def crearExpresion(tokens) do
    #{lista,resto} = expresion(tokens,[],:expresion)
    #IO.puts lista

    case (expresion(tokens,[],:expresion)) do
      {:error,mensaje} -> {:error,mensaje}
      {lista,resto} ->





    #Aplica los operadores unarios
    {:operador,lista,_}=Enum.reduce(lista,{:expresion,[],nil}, fn sig,acc -> 
      {sigEsperado,lista2,opUnarios} = acc
      #IO.puts opUnarios
      if (sigEsperado==:expresion) do
        if opUnarios==nil do
          if sig not in ["-","~","!"] do
            lista2 = lista2++[sig]
            {:operador,lista2,nil}
          else
            {:expresion,lista2,[sig]}
          end
        else
          if sig not in ["-","~","!"] do
            sigAux = Enum.reduce(opUnarios,sig, fn op,acc -> 
              case op do
                "-" -> {:opUnario,"negation",acc}
                "~" -> {:opUnario,"bwComp",acc}
                "!" -> {:opUnario,"logNeg",acc}
              end
            end)
            #IO.puts sigAux
            lista2 = lista2++[sigAux]
            {:operador,lista2,nil}
          else
            {:expresion,lista2,[sig|opUnarios]}
          end
        end 
      else
        if sig in ["+","-","*","/"] do
          lista2 = lista2++[sig]
          {:expresion,lista2,nil}
        else
          {:error, "Unexpected error creating expresion, expecting binary operator, got #{sig}",nil}
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
        if sig in ["*","/"] do
          ultimoElem = List.last(lista2)
          lista2 = List.delete_at(lista2,(length lista2)-1)
          {:expresion,lista2,{ultimoElem,sig}}
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
        if sig in ["+","-"] do
          ultimoElem = List.last(lista2)
          lista2 = List.delete_at(lista2,(length lista2)-1)
          {:expresion,lista2,{ultimoElem,sig}}
        else
          {:operador,[{:error,"Unexpected error reading add and sub operators"}],nil}
        end
      end
    end)

    {(hd lista),resto}


      _ ->
        {:error,"Unexpected error creating expresion"}
    end

  end

  def expresion(tokens,lista,sigEsperado) do ## 2; debe devolver el ; en la lista de tokens
    ##Falta validar la longitud de tokens
    [aux|resto] = tokens
    ##Cambiar todo el case para aceptar mas casos
    if sigEsperado==:expresion do
      case identificador(aux) do
        :cadena -> 
          lista = lista++[{:cadena,aux}]
          expresion(resto,lista,:operador)
        :id -> 
          lista = lista++[{:variable,aux}]
          expresion(resto,lista,:operador)
        :flotante -> 
          {valor,_rest} = Float.parse(aux)
          lista = lista++[{:float,valor}]
          expresion(resto,lista,:operador)
        :int ->
          {valor,_rest} = Integer.parse(aux)
          lista = lista++[{:int,valor}]
          expresion(resto,lista,:operador)
        _otro ->
          case aux do
            "-" ->
              lista = lista++["-"]
              expresion(resto,lista,:expresion)
            "~" ->
              lista = lista++["~"]
              expresion(resto,lista,:expresion)
            "!" ->
              lista = lista++["!"]
              expresion(resto,lista,:expresion)
            "(" ->
              case crearExpresion(resto) do
                {:error,mensaje} ->
                  {:error, mensaje}
                {elem,resto} ->
                  [sig|resto] = resto
                  if sig==")" do
                    lista = lista++[elem]
                    expresion(resto,lista,:operador)
                  else
                    {:error, " Expected ), got instead #{sig}"}
                  end
                  
              end
            _ ->
              {:error, " Got unexpected token #{aux}, missing expresion"} 
          end
      end
    else
      if aux in ["+","-","*","/"] do
        lista = lista ++ [aux]
        expresion(resto,lista,:expresion)
      else
        {lista,[aux|resto]}
      end
    end
  end

  def parametros(tokens,lista) do #Tipo (int a, char c, float d) do
    [aux|resto] = tokens
    if ((aux == "\(") and Enum.count(lista)==0) do
      parametros(resto,lista)
    else

      if (aux == "\)") do
        {lista,resto}
      else
        IO.puts "Entro a else"
        if Enum.count(tokens)>=2 do
          [aux1|[aux2|resto]] = tokens
          if identificador(aux1)==:tipoDato and aux1 != "void" and identificador(aux2)==:id do
            [aux|resto]=resto
            case aux do
              "," -> parametros(resto,lista++[{:parametro,aux1,aux2}])
              "\)" -> parametros([aux|resto],lista++[{:parametro,aux1,aux2}])
              _ -> {:error,"Expected ) or , instead got "<>aux}
            end
          else
            {:error,"#Sintaxis de parametro invalida "<>aux1<>" "<>aux2}
          end
        else
            {:error,"Lectura de parametros termino antes de lo esperado"}
        end
      end
    end
  end

  def returnStatement(tokens) do
    if Enum.count(tokens)>=2 do
      [_aux1|[aux|tokens]] = tokens
      if (aux==";") do
        {{:return,:empty},tokens}
      else
        case crearExpresion([aux|tokens]) do
          {:error,mensaje} -> {:error,mensaje<>" ...in return statement"}
          {expr,tokens} -> 
            [aux|tokens] = tokens
            if (aux==";") do
              {{:return,expr},tokens}
            else
              {:error, "Unexpected token in return statement, expected ';', got "<>aux}
            end
          _ -> {:error, "Unexpected error reading return statement"}
        end
      end
    else
      {:error, "Return statement ends before expected"}
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
