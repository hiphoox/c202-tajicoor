defmodule CompiTajicoor do
  @moduledoc """
  Documentation for `CompiTajicoor`.
  """

  @doc """
  Modulo para manejar el resto de los modulos

  ## Examples



  """
  def mainCompleto(nombreArchivo) do
    IO.puts "- -\tLeyendo archivo...\t - - "
    archivo = Lector.lectorArchivo(nombreArchivo)
    IO.puts archivo
    IO.puts "- -\tEjecutando lexer\t - -"
    listaTokens = Lexer.lexer2(archivo)
    #IO.puts listaTokens
    IO.puts "- -\t Limpiando lista de tokens\t - - "
    listaTokens = Lexer.borrarComentarios2(listaTokens)
    #IO.puts listaTokens
    IO.puts "- -\t Parser2\t - - "
    ast=Parser2.main(listaTokens)
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
      IO.puts "There was an error in file, assembler not created "
    end
    #listaTokens
  end


  def pruebas(nombreArchivo) do
    IO.puts "\n\n# # # # # # # # # # #"
    IO.puts "Reading file #{nombreArchivo}"
    archivo = Lector.lectorArchivo(nombreArchivo)
    #IO.puts archivo
    listaTokens = Lexer.lexer2(archivo)
    listaTokens = Lexer.borrarComentarios2(listaTokens)
    ast=Parser2.main(listaTokens)
    ##IO.puts ast
    if (Ast.validar(ast)==false) do
      :ok
    else
      Prettyprinter.main(ast,nombreArchivo,archivo)
      :error
    end
  end

  def mainCLI(nombreArchivo,v,_s,nombreEjecutable) do
    if v do IO.puts "- -\tLeyendo archivo...\t - - " end
    archivo = Lector.lectorArchivo(nombreArchivo)
    if v do IO.puts archivo end
    if v do IO.puts "- -\tEjecutando lexer\t - -" end
    listaTokens = Lexer.lexer2(archivo)
    #IO.puts listaTokens
    if v do IO.puts "- -\t Limpiando lista de tokens\t - - " end
    listaTokens = Lexer.borrarComentarios2(listaTokens)
    ##IO.puts listaTokens
    if v do IO.puts "- -\t Parser2\t - - " end
    ast=Parser2.main(listaTokens)
    ##IO.puts ast
    if v do IO.puts "- -\t Validar\t - -" end
    validando = Ast.validar(ast)
    if v do IO.puts validando end
    if v do IO.puts "- -\t PrettyPrinting\t - -" end
    if v do Prettyprinter.main(ast,nombreArchivo,archivo) end
    if validando==false do
      if v do IO.puts "- -\t Generador de Codigo\t - -" end
      codigo = CodeGenerator.create(ast)
      if v do IO.puts codigo end
      if v do IO.puts "- -\t Creador de Ejecutable\t - -" end
      Gcc.exeCreator(nombreEjecutable)
    else
      if v != true do Prettyprinter.main(ast,nombreArchivo,archivo) end
      IO.puts "There was an error in file, assembler not created "
    end
    #listaTokens
  end

  def old_pruebas(nombreArchivo) do
    IO.puts "# # # # # # # # # # #"
    IO.puts "Leyendo archivo #{nombreArchivo}"
    archivo = Lector.lectorArchivo(nombreArchivo)
    #IO.puts archivo
    listaTokens = Lexer.lexer(archivo)
    listaTokens = Lexer.borrarComentarios(listaTokens)
    ast=Parser.main(listaTokens)
    ##IO.puts ast
    if (Ast.validar(ast)==false) do
      :ok
    else
      Prettyprinter.main(ast,nombreArchivo,archivo)
      :error
    end
  end
end
