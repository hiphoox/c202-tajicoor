defmodule CompilerTAJICOORTest do
  use ExUnit.Case
  doctest CompilerTAJICOOR

  test "Archivo inexistente en el directorio" do
    assert CompilerScorpions.compile("/codigo_inexistente.c", :no_output) == "Archivo inválido o no existe en el directorio."
  end

 # test "Argumentos inválidos del programa (--token -o codigo.c)" do
  #  assert CompilerScorpions.main(["--token", "-o", "codigo.c"]) == "Compilador de C de Scorpions. Escriba -h para la ayuda."

  #end
end
