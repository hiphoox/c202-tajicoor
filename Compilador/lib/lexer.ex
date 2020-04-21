defmodule Lexer do
  @moduledoc """
  Documentation for `Lexer`.
  """

  @doc """
  Modulo de pruebas para el lexer

  ## Examples

      #iex> Pruebaselixir.recibir(:ok)
      #"Error inesperado"


  require Regex
  require Enum

  """
  def lexer(cadena) do
    #cadena = "#include <stdio.h> int main() {int a=2;float b=2,c=56.3; if(1==1 || 1!=0) {printf(\"Saludos\");} return a;}"
    Regex.scan(~r/\/\*.*\*\/|\/\/.*\n|".*"|int|void|float|double|char|main|struct|break|if|else|long|switch|case|for|while|do|default|const|\(|\)|{|}|\[|\]|;|,|\+=|\+|\-=|\-|\/=|\/|\*=|\*|\%|\~|!=|!|\&\&|\|\||#include|==|=|[0-9]+\.[0-9]+|[0-9]+|<"?[[:alnum:]\.]+"?>|[[:alnum:]]+/,cadena)
  end

  def lexer2(cadena) do
    lineas=Regex.split(~r/\n/,cadena)
    {_,listaTokens}=Enum.reduce(lineas,{1,[]},fn x,acc->
      {numLinea,tokens} = acc
      encontrados=regexFunc(x)
      posiciones=regexFuncPosition(x)
      #IO.puts posiciones
      {_,lineaConvertida}=Enum.reduce(encontrados,{posiciones,[]},fn x,acc -> 
        {posic,listaAux}=acc
        [head|posic]=posic
        {posic,listaAux++[%{:content => (hd x) , :line => numLinea, :col => (hd head)}] }
      end)
      {numLinea+1,tokens++lineaConvertida}
    end)
    listaTokens
  end

  def regexFunc(cadena) do
    Regex.scan(~r/\/\*.*\*\/|\/\/.*|".*"|int|void|float|double|char|main|struct|break|if|else|long|switch|case|for|while|do|default|const|\(|\)|{|}|\[|\]|;|,|\+=|\+|\-=|\-|\/=|\/|\*=|\*|\%|\~|!=|!|\&\&|\|\||#include|==|=|[0-9]+\.[0-9]+|[0-9]+|<"?[[:alnum:]\.]+"?>|[[:alnum:]]+/,cadena)
  end

  def regexFuncPosition(cadena) do
    Regex.scan(~r/\/\*.*\*\/|\/\/.*|".*"|int|void|float|double|char|main|struct|break|if|else|long|switch|case|for|while|do|default|const|\(|\)|{|}|\[|\]|;|,|\+=|\+|\-=|\-|\/=|\/|\*=|\*|\%|\~|!=|!|\&\&|\|\||#include|==|=|[0-9]+\.[0-9]+|[0-9]+|<"?[[:alnum:]\.]+"?>|[[:alnum:]]+/,cadena,return: :index)
  end

  def borrarComentarios(lista) do
    borrables = Enum.map_every(lista,1, fn x -> Regex.run(~r/^\/\*.*\*\/|\/\/.*\n$/,hd x) end)
    lista = lista -- borrables
    Enum.map_every(lista,1, fn x -> hd x end)
  end

  def borrarComentarios2(lista) do
    borrables = Enum.filter(lista,fn x -> Regex.run(~r/^\/\*.*\*\/|\/\/.*$/,x[:content])==nil end)
    #borrables = borrables--[nil]
    #Enum.reduce(lista)
    #Enum.map_every(lista,1, fn x -> hd x end)
    borrables
  end

end

