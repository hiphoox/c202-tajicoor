defmodule ParserTest do
  use ExUnit.Case
  doctest CompilerTAJICOOR

  setup_all do
    {:ok,
     ast: {:ok, {:program, "program",
             {:function, "main",
              {:return_Keyword, "return", {:constant, 2, {}, {}}, {}}, {}}, {}}
             }}
  end

  test "Prueba 1 de Nora Sandler: árbol ast de un código que devuelve 2", state do
    token_list = Lexer.scan_word(File.read!("test/return_2.c"), :no_output);
    assert  Parser.parse_tokens(elem(token_list, 1), :no_output) == state[:ast]
  end

  test "Prueba 2 de Nora Sandler: árbol ast de un código que devuelve 100" do
    token_list = Lexer.scan_word(File.read!("test/multi_digit.c"), :no_output);
    assert  Parser.parse_tokens(elem(token_list, 1), :no_output) ==
      {:ok, {:program, "program",
              {:function, "main",
               {:return_Keyword, "return", {:constant, 100, {}, {}}, {}}, {}}, {}}}
  end

  test "Prueba 3 de Nora Sandler: código al cual le falta un paréntesis que cierra" do
    token_list = Lexer.scan_word(File.read!("test/missing_paren.c"), :no_output);
    assert  Parser.parse_tokens(elem(token_list, 1), :no_output) == {:error, "Error de sintáxis. Se esperaba ) y se encontró: {"}
  end

  test "Prueba 4 de Nora Sandler: Sin valor de retorno" do
    token_list = Lexer.scan_word(File.read!("test/missing_retval.c"), :no_output);
    assert  Parser.parse_tokens(elem(token_list, 1), :no_output) == {:error, "Error de sintaxis: Se esperaba una constante u operador y se encontró ;."}
  end

  #test "Prueba 11 INVÁLIDA de Nora Sandler: Sin punto y coma" do
   # token_list = Lexer.scan_word(File.read!("test/no_semicolon.c"), :no_output);
  #  assert  Parser.parse_tokens(elem(token_list, 1), :no_output) == {:error, "Error de sintáxis. Se esperaba ; y se encontró: }"}
 # end


end
