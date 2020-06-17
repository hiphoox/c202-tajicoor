defmodule CompiTajicoorTest do
  use ExUnit.Case
  doctest CompiTajicoor



  test "programa 1 no valido de semana 1" do
    #int main( {
    #    return 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_1/invalid/missing_paren.c") == :error
  end

  test "programa 2 no valido de semana 1" do
    #int main {
    #    return 0;

    assert CompiTajicoor.pruebas("test_files/stage_1/invalid/no_brace.c") == :error
  end

  test "programa 3 no valido de semana 1" do
    #int main() {
    #    return 0
    #}

    assert CompiTajicoor.pruebas("test_files/stage_1/invalid/no_semicolon.c") == :error
  end

  test "programa 4 no valido de semana 1" do
    #int main() {
    #    RETURN 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_1/invalid/wrong_case.c") == :error
  end

  test "programa 5 no valido de semana 1" do
    #int main() {
    #    return0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_1/invalid/no_space.c") == :error
  end

  test "programa 1 valido de semana 1" do
    #int main() {
    #    return 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_1/valid/return_2.c") == :ok
  end

  test "programa 1 valido de semana 1. Prueba de valor de retorno." do
    #int main() {
    #    return 2;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_1/valid/return_2.c") == :ok
  end

  test "programa 2 valido de semana 1" do
    #int main() {
    #    return 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_1/valid/return_0.c") == :ok
  end

  test "programa 2 valido de semana 1. Prueba de valor de retorno." do
    #int main() {
    #    return 0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_1/valid/return_0.c") == :ok
  end

  test "programa 3 valido de semana 1" do
    #int main() {
    #    return 100;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_1/valid/multi_digit.c") == :ok
  end

  test "programa 3 valido de semana 1. Prueba de valor de retorno." do
    #int main() {
    #    return 100;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_1/valid/multi_digit.c") == :ok
  end

  test "programa 4 valido de semana 1" do
    #   int   main    (  )  {   return  0 ; }
    assert CompiTajicoor.pruebas("test_files/stage_1/valid/spaces.c") == :ok
  end

  test "programa 4 valido de semana 1. Prueba de valor de retorno." do
    #   int   main    (  )  {   return  0 ; }
    assert CompiTajicoor.pruebaSalida("test_files/stage_1/valid/spaces.c") == :ok
  end

  test "programa 5 valido de semana 1" do
    #
    #int 
    #main
    #(   
    #)
    #{
    #return
    #0
    #;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_1/valid/newlines.c") == :ok
  end

  test "programa 5 valido de semana 1. Prueba de valor de retorno." do
    #
    #int 
    #main
    #(   
    #)
    #{
    #return
    #0
    #;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_1/valid/newlines.c") == :ok
  end

  test "programa 6 valido de semana 1" do
    #int main(){return 0;}
    assert CompiTajicoor.pruebas("test_files/stage_1/valid/no_newlines.c") == :ok
  end

  test "programa 1 no valido de semana 2" do
    #int main() {
    #    return !5
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/invalid/missing_semicolon.c") == :error
  end

  test "programa 2 no valido de semana 2" do
    #int main() {
    #    return !~;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/invalid/nested_missing_const.c") == :error
  end

  test "programa 3 no valido de semana 2" do
    #int main() {
    #    return !;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/invalid/missing_const.c") == :error
  end

  test "programa 4 no valido de semana 2" do
    #int main() {
    #    return 4-;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/invalid/wrong_order.c") == :error
  end

  test "programa 1 valido de semana 2" do
    #int main() {
    #    return !-3;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/valid/nested_ops.c") == :ok
  end

  test "programa 1 valido de semana 2. Prueba de valor de retorno." do
    #int main() {
    #    return !-3;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_2/valid/nested_ops.c") == :ok
  end

  test "programa 2 valido de semana 2" do
    #int main() {
    #    return !5;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/valid/not_five.c") == :ok
  end

  test "programa 2 valido de semana 2. Prueba de valor de retorno." do
    #int main() {
    #    return !5;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_2/valid/not_five.c") == :ok
  end

  test "programa 3 valido de semana 2" do
    #int main() {
    #    return !12;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/valid/bitwise.c") == :ok
  end

  test "programa 3 valido de semana 2. Prueba de valor de retorno." do
    #int main() {
    #    return !12;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_2/valid/bitwise.c") == :ok
  end

  test "programa 4 valido de semana 2" do
    #int main() {
    #    return ~0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/valid/bitwise_zero.c") == :ok
  end

  test "programa 4 valido de semana 2. Prueba de valor de retorno." do
    #int main() {
    #    return ~0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_2/valid/bitwise_zero.c") == :ok
  end

  test "programa 5 valido de semana 2" do
    #int main() {
    #    return -~0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/valid/nested_ops_2.c") == :ok
  end

  test "programa 5 valido de semana 2. Prueba de valor de retorno." do
    #int main() {
    #    return -~0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_2/valid/nested_ops_2.c") == :ok
  end

  test "programa 6 valido de semana 2" do
    #int main() {
    #    return !0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/valid/not_zero.c") == :ok
  end

  test "programa 7 valido de semana 2" do
    #int main() {
    #    return -5;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_2/valid/neg.c") == :ok
  end

  test "programa 7 valido de semana 2. Prueba de valor de retorno." do
    #int main() {
    #    return -5;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_2/valid/neg.c") == :ok
  end

  test "programa 1 no valido de semana 3" do
    #int main() {
    #    return /3;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/invalid/missing_first_op.c") == :error
  end

  test "programa 2 no valido de semana 3" do
    #int main() {
    #    return 2 (- 3);
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/invalid/malformed_paren.c") == :error
  end

  test "programa 3 no valido de semana 3" do
    #int main() {
    #    return 2*2
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/invalid/no_semicolon.c") == :error
  end

  test "programa 4 no valido de semana 3" do
    #int main() {
    #    return 1 + ;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/invalid/missing_second_op.c") == :error
  end

  test "programa 1 valido de semana 3" do
    #int main() {
    #    return 1 - 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/sub.c") == :ok
  end

  test "programa 1 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return 1 - 2;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/sub.c") == :ok
  end

  test "programa 2 valido de semana 3" do
    #int main() {
    #    return 2- -1;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/sub_neg.c") == :ok
  end

  test "programa 2 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return 2- -1;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/sub_neg.c") == :ok
  end

  test "programa 3 valido de semana 3" do
    #int main() {
    #    return (-12) / 5;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/div_neg.c") == :ok
  end

  test "programa 3 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return (-12) / 5;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/div_neg.c") == :ok
  end

  test "programa 4 valido de semana 3" do
    #int main() {
    #    return ~(1 + 1);
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/unop_parens.c") == :ok
  end

  test "programa 4 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return ~(1 + 1);
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/unop_parens.c") == :ok
  end

  test "programa 5 valido de semana 3" do
    #int main() {
    #    return 2 * 3;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/mult.c") == :ok
  end

  test "programa 5 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return 2 * 3;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/mult.c") == :ok
  end

  test "programa 6 valido de semana 3" do
    #int main() {
    #    return ~2 + 3;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/unop_add.c") == :ok
  end

  test "programa 7 valido de semana 3" do
    #int main() {
    #    return 1 + 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/add.c") == :ok
  end

  test "programa 7 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return 1 + 2;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/add.c") == :ok
  end

  test "programa 8 valido de semana 3" do
    #int main() {
    #    return 6 / 3 / 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/associativity_2.c") == :ok
  end

  test "programa 9 valido de semana 3" do
    #int main() {
    #    return 4 / 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/div.c") == :ok
  end

  test "programa 9 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return 4 / 2;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/div.c") == :ok
  end

  test "programa 10 valido de semana 3" do
    #int main() {
    #    return 2 + 3 * 4;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/precedence.c") == :ok
  end

  test "programa 10 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return 2 + 3 * 4;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/precedence.c") == :ok
  end

  test "programa 11 valido de semana 3" do
    #int main() {
    #    return 2 * (3 + 4);
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/parens.c") == :ok
  end

  test "programa 11 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return 2 * (3 + 4);
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/parens.c") == :ok
  end

  test "programa 12 valido de semana 3" do
    #int main() {
    #    return 1 - 2 - 3;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_3/valid/associativity.c") == :ok
  end

  test "programa 12 valido de semana 3. Prueba de valor de retorno." do
    #int main() {
    #    return 1 - 2 - 3;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_3/valid/associativity.c") == :ok
  end

  test "programa 1 no valido de semana 4" do
    #int main() {
    #    return 1 || 2
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/invalid/missing_semicolon.c") == :error
  end

  test "programa 2 no valido de semana 4" do
    #int main() {
    #    return <= 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/invalid/missing_first_op.c") == :error
  end

  test "programa 3 no valido de semana 4" do
    #int main() {
    #    return 1 < > 3;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/invalid/missing_mid_op.c") == :error
  end

  test "programa 4 no valido de semana 4" do
    #int main() {
    #    return 2 &&
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/invalid/missing_second_op.c") == :error
  end

  test "programa 1 valido de semana 4" do
    #int main() {
    #    return 1 && 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/and_false.c") == :ok
  end

  test "programa 1 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 && 0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/and_false.c") == :ok
  end

  test "programa 2 valido de semana 4" do
    #int main() {
    #    return 1 > 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/gt_false.c") == :ok
  end

  test "programa 2 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 > 2;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/gt_false.c") == :ok
  end

  test "programa 3 valido de semana 4" do
    #int main() {
    #    return 1 || 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/or_true.c") == :ok
  end

  test "programa 3 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 || 0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/or_true.c") == :ok
  end

  test "programa 4 valido de semana 4" do
    #int main() {
    #    return 1 >= 1;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/ge_true.c") == :ok
  end

  test "programa 4 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 >= 1;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/ge_true.c") == :ok
  end

  test "programa 5 valido de semana 4" do
    #int main() {
    #    return 0 != 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/ne_false.c") == :ok
  end

  test "programa 5 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 0 != 0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/ne_false.c") == :ok
  end

  test "programa 6 valido de semana 4" do
    #int main() {
    #    return 2 < 1;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/lt_false.c") == :ok
  end

  test "programa 7 valido de semana 4" do
    #int main() {
    #    return 1 == 1;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/eq_true.c") == :ok
  end

  test "programa 7 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 == 1;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/eq_true.c") == :ok
  end

  test "programa 8 valido de semana 4" do
    #int main() {
    #    return 1 < 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/lt_true.c") == :ok
  end

  test "programa 9 valido de semana 4" do
    #int main() {
    #    return 1 == 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/eq_false.c") == :ok
  end

  test "programa 9 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 == 2;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/eq_false.c") == :ok
  end

  test "programa 10 valido de semana 4" do
    #int main() {
    #    return 1 <= -1;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/le_false.c") == :ok
  end

  test "programa 10 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 <= -1;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/le_false.c") == :ok
  end

  test "programa 11 valido de semana 4" do
    #int main() {
    #    return 0 || 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/or_false.c") == :ok
  end

  test "programa 11 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 0 || 0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/or_false.c") == :ok
  end

  test "programa 12 valido de semana 4" do
    #int main() {
    #    return 1 >= 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/ge_false.c") == :ok
  end

  test "programa 12 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 >= 2;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/ge_false.c") == :ok
  end

  test "programa 13 valido de semana 4" do
    #int main() {
    #    return 1 && -1;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/and_true.c") == :ok
  end

  test "programa 13 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 && -1;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/and_true.c") == :ok
  end

  test "programa 14 valido de semana 4" do
    #int main() {
    #    return -1 != -2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/ne_true.c") == :ok
  end

  test "programa 14 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return -1 != -2;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/ne_true.c") == :ok
  end

  test "programa 15 valido de semana 4" do
    #int main() {
    #    return 1 > 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/gt_true.c") == :ok
  end

  test "programa 15 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 > 0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/gt_true.c") == :ok
  end

  test "programa 16 valido de semana 4" do
    #int main() {
    #    return 2 == 2 || 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/precedence_4.c") == :ok
  end

  test "programa 16 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 2 == 2 || 0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/precedence_4.c") == :ok
  end

  test "programa 17 valido de semana 4" do
    #int main() {
    #    return 1 || 0 && 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/precedence.c") == :ok
  end

  test "programa 17 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 1 || 0 && 2;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/precedence.c") == :ok
  end

  test "programa 18 valido de semana 4" do
    #int main() {
    #    return 0 <= 2;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/le_true.c") == :ok
  end

  test "programa 19 valido de semana 4" do
    #int main() {
    #    return 2 == 2 > 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/precedence_3.c") == :ok
  end

  test "programa 19 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return 2 == 2 > 0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/precedence_3.c") == :ok
  end

  test "programa 20 valido de semana 4" do
    #int main() {
    #    return (1 || 0) && 0;
    #}
    assert CompiTajicoor.pruebas("test_files/stage_4/valid/precedence_2.c") == :ok
  end

  test "programa 20 valido de semana 4. Prueba de valor de retorno." do
    #int main() {
    #    return (1 || 0) && 0;
    #}
    assert CompiTajicoor.pruebaSalida("test_files/stage_4/valid/precedence_2.c") == :ok
  end

end
