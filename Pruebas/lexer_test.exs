# Salidas de Lexer
# int  -> :pclave_int 
# main -> :pclave_main
# ( -> :abre_paren
# ) -> :cierra_paren
# { -> :abre_llave
# return -> :pclave_return
# ; -> :puntoycoma
# } -> cierra_llave
# Lo restante debe ser constante


defmodule LexerTest do
  use ExUnit.Case
  doctest Lexer

###### - Casos validos ######

  setup_all do
    {:ok,
      tokens: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, {:constante, 2}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_100: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, {:constante, 100}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_0: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, {:constante, 0}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_se: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {1, :pclave_return},
    {1, {:constante, 2}},
    {1, :puntoycoma},
    {1, :cierra_llave}
    ], 

    tokens_1: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, :negacion},
    {2, {:constante, 2}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_2: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, :negacion_logica},
    {2, {:constante, 2}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_3: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, :complemento},
    {2, {:constante, 2}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_nl: [
    {1, :pclave_int},
    {2, :pclave_main},
    {3, :abre_paren},
    {4, :cierra_paren},
    {5, :abre_llave},
    {6, :pclave_return},
    {7, {:constante, 2}},
    {8, :puntoycoma},
    {9, :cierra_llave}
    ], 

    tokens_4: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, :negacion},
    {2, :complemento},
    {2, {:constante, 0}},
    {2, :puntoycoma},
    {3, :cierra_llave}  
    ],
    
    tokens_5: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, :negacion_logica},
    {2, :negacion},
    {2, {:constante, 3}},
    {2, :puntoycoma},
    {3, :cierra_llave}  
    ],

    tokens_add: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, {:constante, 1}},
    {2, :suma},
    {2, {:constante, 2}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_aso: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, {:constante, 1}},
    {2, :negacion},
    {2, {:constante, 2}},
    {2, :negacion},
    {2, {:constante, 3}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_aso2: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, {:constante, 6}},
    {2, :division},
    {2, {:constante, 3}},
    {2, :division},
    {2, {:constante, 2}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_paren: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, {:constante, 2}},
    {2, :multiplicacion},
    {2, :abre_paren},
    {2, {:constante, 3}},
    {2, :suma},
    {2, {:constante, 4}},
    {2, :cierra_paren},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_subNeg: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, {:constante, 2}},
    {2, :negacion},
    {2, :negacion},
    {2, {:constante, 1}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_unopP: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, :complemento},
    {2, :abre_paren},
    {2, {:constante, 1}},
    {2, :suma},
    {2, {:constante, 1}},
    {2, :cierra_paren},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ], 

    tokens_prec24: [
    {1, :pclave_int},
    {1, :pclave_main},
    {1, :abre_paren},
    {1, :cierra_paren},
    {1, :abre_llave},
    {2, :pclave_return},
    {2, :abre_paren},
    {2, {:constante, 1}},
    {2, :o_logico},
    {2, {:constante, 0}},
    {2, :cierra_paren},
    {2, :ampersand},
    {2, {:constante, 0}},
    {2, :puntoycoma},
    {3, :cierra_llave}
    ]

  }end

########### - Pruebas validas semana 1 ###########

  test " Return 2", state do
    assert Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "return "], [2, "2;"], [3, "}"]], []
  ) == state[:tokens]
  end
  
  test " Return 0", state do
    assert Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "return "], [2, "0;"], [3, "}"]], []
  ) == state[:tokens_0]
  end
  
  test " Return 100", state do
    assert Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "return "], [2, "100;"], [3, "}"]], []
  ) == state[:tokens_100]
  end
  
  test " Solo espaciado", state do
    assert Lexer.lexer_principal([[1, "int "], [1, "main"], [1, "("], [1, ")"], [1, "{"], [1, "return "], [1, "2"], [1, ";"], [1, "}"]], []
  ) == state[:tokens_se]
  end
  
  test " Solo saltos de linea", state do
    assert Lexer.lexer_principal([[1, "int "], [2, "main"], [3, "("], [4, ")"], [5, "{"], [6, "return "], [7, "2"], [8, ";"], [9, "}"]], []
  ) == state[:tokens_nl]
  end
  
  test " Sin saltos de linea", state do
    assert Lexer.lexer_principal([[1, "int "], [1, "main"], [1, "("], [1, ")"], [1, "{"], [1, "return "], [1, "2"], [1, ";"], [1, "}"]], []
  ) == state[:tokens_se]
  end

########### - Pruebas NO validas semana 1 ###########
 
  test " Caso erroneo", _state do
    ##expected_result = List.update_at(state[:tokens], 5, fn _ -> {2, :error} end)
    expected_result = {:error, "linea: 2; error_token no definido"} ## se cambio la desc, RETURN
    assert Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "RETURN "], [2, "2;"], [3, "}"]], []
      ) == expected_result
  end

  test " Sin espacio entre tokens", _state do
    ##expected_result = List.update_at(state[:tokens], 5, fn _ -> {2, :error} end)
    expected_result = {:error, "linea: 2; error_token no definido" } # se cambio la desd.return2 indefinido"
    assert Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "return2;"], [3, "}"]], []
      ) == expected_result
  end

  test " Falta punto y coma", state do
    expected_result = state[:tokens] -- [{2, :puntoycoma}]
    assert Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "return "], [2, "2"], [3, "}"]], []
      ) == expected_result
  end

  test " Faltan parentesis", state do
    expected_result = state[:tokens] -- [{1, :abre_paren}, {1, :cierra_paren},]
    assert Lexer.lexer_principal([[1, "int "], [1, "main"], [1, "{"], [2, "return "], [2, "2;"], [3, "}"]], []
      ) == expected_result
  end

  test " Falta valor a retornar", state do
    expected_result = state[:tokens] -- [{2, {:constante, 2}}]
    assert Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "return ;"], [3, "}"]], []
      ) == expected_result
  end

  test " Falta cerrar parentesis", state do
    expected_result = state[:tokens] -- [{1, :cierra_paren}]
    assert Lexer.lexer_principal([[1, "int "], [1, "main("], [1, "{"], [2, "return "], [2, "2;"], [3, "}"]], []
      ) == expected_result
  end
