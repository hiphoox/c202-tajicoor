defmodule Main do
  @moduledoc """
  Documentation for `Main`.
  """

  @doc """
  Modulo para manejar el resto de los modulos

  ## Examples


      #iex> Main.pruebas("semana1.c")
      #:ok


  """


  def mainCompleto(nombreArchivo) do
    IO.puts "- -\tLeyendo archivo...\t - - "
    archivo = Lector.lectorArchivo(nombreArchivo)
    IO.puts archivo
    IO.puts "- -\tEjecutando lexer\t - -"
    listaTokens = Lexer.lexer(archivo)
    IO.puts listaTokens
    IO.puts "- -\t Limpiando lista de tokens\t - - "
    listaTokens = Lexer.borrarComentarios(listaTokens)
    IO.puts listaTokens
    IO.puts "- -\t Parser\t - - "
    ast=Parser.main(listaTokens)
    ##IO.puts ast
    IO.puts "- -\t Validar\t - -"
    validando = Ast.validar(ast)
    IO.puts validando
    IO.puts "- -\t PrettyPrinting\t - -"
    Prettyprinter.main(ast,nombreArchivo,archivo)
    if validando==false do
      IO.puts "- -\t Generador de Codigo\t - -"
      codigo = CodeGenerator.create(ast)
      IO.puts codigo
      IO.puts "- -\t Creador de Ejecutable\t - -"
      Gcc.exeCreator("out")
    else
      IO.puts "Hubo un error en la sintaxis del codigo"
    end
    #listaTokens
  end


  def pruebas(nombreArchivo) do
    archivo = Lector.lectorArchivo(nombreArchivo)
    IO.puts archivo
    listaTokens = Lexer.lexer(archivo)
    listaTokens = Lexer.borrarComentarios(listaTokens)
    ast=Parser.main(listaTokens)
    ##IO.puts ast
    if (Ast.validar(ast)==false) do
      :ok
    else
      :error
    end
  end


end
