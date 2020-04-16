defmodule PruebaselixirTest do
  use ExUnit.Case
  doctest Pruebaselixir

  test "programa 1 valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/valid/multi_digit.c") == :ok
  end



  test "programa 2 valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/valid/newlines.c") == :ok
  end



  test "programa 3 valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/valid/no_newlines.c") == :ok
  end



  test "programa 4 valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/valid/return_0.c") == :ok
  end



  test "programa 5 valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/valid/return_2.c") == :ok
  end



  test "programa 6 valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/valid/spaces.c") == :ok
  end



  test "programa 1 no valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/invalid/missing_paren.c") == :error
  end



  test "programa 2 no valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/invalid/no_brace.c") == :error
  end



  test "programa 3 no valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/invalid/no_space.c") == :error
  end



  test "programa 4 no valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/invalid/no_semicolon.c") == :error
  end



  test "programa 5 no valido de semana 1" do
    assert Main.pruebas("test_files/stage_1/invalid/wrong_case.c") == :error
  end



  test "programa 1 valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/valid/bitwise.c") == :ok
  end



  test "programa 2 valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/valid/neg.c") == :ok
  end



  test "programa 3 valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/valid/nested_ops.c") == :ok
  end



  test "programa 4 valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/valid/not_zero.c") == :ok
  end



  test "programa 5 valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/valid/bitwise_zero.c") == :ok
  end



  test "programa 6 valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/valid/nested_ops_2.c") == :ok
  end



  test "programa 7 valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/valid/not_five.c") == :ok
  end



  test "programa 1 no valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/invalid/missing_const.c") == :error
  end



  test "programa 2 no valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/invalid/missing_semicolon.c") == :error
  end



  test "programa 3 no valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/invalid/nested_missing_const.c") == :error
  end



  test "programa 4 no valido de semana 2" do
    assert Main.pruebas("test_files/stage_2/invalid/wrong_order.c") == :error
  end



  test "programa 1 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/add.c") == :ok
  end



  test "programa 2 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/div.c") == :ok
  end



  test "programa 3 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/parens.c") == :ok
  end



  test "programa 4 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/sub_neg.c") == :ok
  end



  test "programa 5 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/associativity_2.c") == :ok
  end



  test "programa 6 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/div_neg.c") == :ok
  end



  test "programa 7 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/precedence.c") == :ok
  end



  test "programa 8 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/unop_add.c") == :ok
  end



  test "programa 9 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/associativity.c") == :ok
  end



  test "programa 10 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/mult.c") == :ok
  end



  test "programa 11 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/sub.c") == :ok
  end



  test "programa 12 valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/valid/unop_parens.c") == :ok
  end



  test "programa 1 no valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/invalid/malformed_paren.c") == :error
  end



  test "programa 2 no valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/invalid/missing_first_op.c") == :error
  end



  test "programa 3 no valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/invalid/missing_second_op.c") == :error
  end



  test "programa 4 no valido de semana 3" do
    assert Main.pruebas("test_files/stage_3/invalid/no_semicolon.c") == :error
  end



end
