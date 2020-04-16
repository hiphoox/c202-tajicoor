defmodule Prettyprinter do
  @moduledoc """
  Documentation for `Prettyprinter`.
  """

  @doc """
  Modulo para imprimir el AST

  require String
  """

  def main(ast) do
    imprimir(ast,"")
  end

  def imprimir(ast,nivel) do
    if is_list(ast) do
      Enum.each(ast,fn(elem) -> imprimir(elem,nivel<>"") end)
    else
      case ast do
        {:declVar,id} ->
          IO.puts nivel<>"VAR DECLARATION"
          IO.puts nivel<>"  <#{id}>"
        {:assign, varName, expr} ->
          IO.puts nivel<>"VAR ASSIGN"
          IO.puts nivel<>"  <#{varName}>"
          imprimir(expr,nivel<>"    ")
        {:directiva,:include,nombre}->
          IO.puts nivel<>"INCLUDE"
          IO.puts nivel<>"  <#{nombre}>"
        {:opUnario,"negation",expr} ->
          IO.puts nivel<>"NEGATION"
          imprimir(expr,nivel<>"  ")
        {:opUnario,"bwComp",expr} ->
          IO.puts nivel<>"BITWISE COMPLEMENT"
          imprimir(expr,nivel<>"  ")
        {:opUnario,"logNeg",expr} ->
          IO.puts nivel<>"LOGICAL NEGATION"
          imprimir(expr,nivel<>"  ")
        {:opBinario,"mult",expr1,expr2} ->
          IO.puts nivel<>"MULTIPLICATION"
          imprimir(expr1,nivel<>"  ")
          imprimir(expr2,nivel<>"  ")
        {:opBinario,"div",expr1,expr2} ->
          IO.puts nivel<>"DIVISION"
          imprimir(expr1,nivel<>"  ")
          imprimir(expr2,nivel<>"  ")
        {:opBinario,"add",expr1,expr2} ->
          IO.puts nivel<>"ADDITION"
          imprimir(expr1,nivel<>"  ")
          imprimir(expr2,nivel<>"  ")
        {:opBinario,"subs",expr1,expr2} ->
          IO.puts nivel<>"SUBSTRACTION"
          imprimir(expr2,nivel<>"  ")
          imprimir(expr1,nivel<>"  ")

        {:function,tipo,id,_param,states} ->
          IO.puts nivel<>"FUN "<>String.upcase(tipo)<>" #{id}:"
          IO.puts nivel<>"  params:"
          IO.puts nivel<>"  body: "
          #Enum.each(states,fn(elem) -> imprimir(elem,nivel<>"    ") end)
          imprimir(states,nivel<>"    ")
        {:return,expr} ->
          IO.puts nivel<>"RETURN "
          imprimir(expr,nivel<>"  ")
        {:int,valor} ->
          IO.puts nivel<>"Int <#{valor}>"
        {:cadena,valor} ->
          IO.puts nivel<>"String <#{valor}>"

        {:error,mensaje} ->
          IO.puts nivel<>"Error <#{mensaje}>"
        _ -> IO.puts nivel<>"##Error leyendo"<>ast
      end
    end
  end

end
