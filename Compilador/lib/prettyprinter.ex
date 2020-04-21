defmodule Prettyprinter do
  @moduledoc """
  Documentation for `Prettyprinter`.
  """

  @doc """
  Modulo para imprimir el AST

  require String
  require Regex
  require Enum
  """

  def main(ast,nombreArchivo,archivo) do
    lineas=Regex.split(~r/\n/,archivo)
    imprimir(ast,"",nombreArchivo,lineas)
  end

  def imprimir(ast,nivel,nombreArchivo,lineas) do
    if is_list(ast) do
      Enum.each(ast,fn(elem) -> imprimir(elem,nivel<>"",nombreArchivo,lineas) end)
    else
      case ast do
        {:declVar,id} ->
          IO.puts nivel<>"VAR DECLARATION"
          IO.puts nivel<>"  <#{id}>"
        {:assign, varName, expr} ->
          IO.puts nivel<>"VAR ASSIGN"
          IO.puts nivel<>"  <#{varName}>"
          imprimir(expr,nivel<>"    ",nombreArchivo,lineas)
        {:directiva,:include,nombre}->
          IO.puts nivel<>"INCLUDE"
          IO.puts nivel<>"  <#{nombre}>"
        {:opUnario,"negation",expr} ->
          IO.puts nivel<>"NEGATION"
          imprimir(expr,nivel<>"  ",nombreArchivo,lineas)
        {:opUnario,"bwComp",expr} ->
          IO.puts nivel<>"BITWISE COMPLEMENT"
          imprimir(expr,nivel<>"  ",nombreArchivo,lineas)
        {:opUnario,"logNeg",expr} ->
          IO.puts nivel<>"LOGICAL NEGATION"
          imprimir(expr,nivel<>"  ",nombreArchivo,lineas)
        {:opBinario,"mult",expr1,expr2} ->
          IO.puts nivel<>"MULTIPLICATION"
          imprimir(expr1,nivel<>"  ",nombreArchivo,lineas)
          imprimir(expr2,nivel<>"  ",nombreArchivo,lineas)
        {:opBinario,"div",expr1,expr2} ->
          IO.puts nivel<>"DIVISION"
          imprimir(expr1,nivel<>"  ",nombreArchivo,lineas)
          imprimir(expr2,nivel<>"  ",nombreArchivo,lineas)
        {:opBinario,"add",expr1,expr2} ->
          IO.puts nivel<>"ADDITION"
          imprimir(expr1,nivel<>"  ",nombreArchivo,lineas)
          imprimir(expr2,nivel<>"  ",nombreArchivo,lineas)
        {:opBinario,"subs",expr1,expr2} ->
          IO.puts nivel<>"SUBSTRACTION"
          imprimir(expr2,nivel<>"  ",nombreArchivo,lineas)
          imprimir(expr1,nivel<>"  ",nombreArchivo,lineas)

        {:function,tipo,id,_param,states} ->
          IO.puts nivel<>"FUN "<>String.upcase(tipo[:content])<>" #{id[:content]}:"
          IO.puts nivel<>"  params:"
          IO.puts nivel<>"  body: "
          #Enum.each(states,fn(elem) -> imprimir(elem,nivel<>"    ") end)
          imprimir(states,nivel<>"    ",nombreArchivo,lineas)
        {:return,expr} ->
          IO.puts nivel<>"RETURN "
          imprimir(expr,nivel<>"  ",nombreArchivo,lineas)
        {:int,valor} ->
          IO.puts nivel<>"Int <#{valor}>"
        {:cadena,valor} ->
          IO.puts nivel<>"String <#{valor}>"
        {:error,mensaje,nil} ->
          IO.puts nivel<>"#{nombreArchivo}: \e[91merror:\e[39m \n\t#{mensaje}"
        {:error,mensaje,token} ->
          {colI,colF}=token[:col]
          IO.puts nivel<>"#{nombreArchivo}:#{token[:line]}:#{colI}: \e[91merror:\e[39m \n\t#{mensaje}"
          #IO.puts "\e[34m#{token[:content]}\e[39m"
          lineaError=Enum.at(lineas,token[:line]-1)
          if colI>0 do
            #inicial=String.slice(lineaError,0..colI-1)
            IO.puts String.slice(lineaError,0..colI-1)<>"\e[34m"<>String.slice(lineaError,colI..colI+colF-1)<>"\e[39m"<>String.slice(lineaError,colI+colF..-1)
          else
            IO.puts "\e[34m"<>String.slice(lineaError,colI..colI+colF-1)<>"\e[39m"<>String.slice(lineaError,colI+colF..-1)
          end
          #IO.puts "#{inicial}\e[34m"<>String.slice(lineaError,colI..colI+colF-1)<>"\e[39m"<>String.slice(lineaError,colI+colF..-1)
        _ -> IO.puts nivel<>"##Error leyendo"<>ast
      end
    end
  end



end
