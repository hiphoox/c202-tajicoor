defmodule ParserTest do
  use ExUnit.Case
  doctest Parser
  doctest Lexer

  setup_all do
    {:ok,
     tokens: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: nil,
              node_name: :constante,
              right_node: nil,
              value: 2
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
     tokens_md: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: nil,
              node_name: :constante,
              right_node: nil,
              value: 100
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
     tokens_0: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: nil,
              node_name: :constante,
              right_node: nil,
              value: 0
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
     tokens_nz: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: nil,
                node_name: :constante,
                right_node: nil,
                value: 0
              },
              node_name: :negacion_logica,
              right_node: nil,
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
     tokens_nc: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: nil,
                node_name: :constante,
                right_node: nil,
                value: 5
              },
              node_name: :negacion_logica,
              right_node: nil,
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
     tokens_no: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 3
                },
                node_name: :negacion,
                right_node: nil,
                value: nil
              },
              node_name: :negacion_logica,
              right_node: nil,
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
     tokens_no2: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 0
                },
                node_name: :complemento,
                right_node: nil,
                value: nil
              },
              node_name: :negacion,
              right_node: nil,
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
     tokens_neg: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: nil,
                node_name: :constante,
                right_node: nil,
                value: 5
              },
              node_name: :negacion,
              right_node: nil,
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
     tokens_b0: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: nil,
                node_name: :constante,
                right_node: nil,
                value: 0
              },
              node_name: :complemento,
              right_node: nil,
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
     tokens_b: [
       {%AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: nil,
                node_name: :constante,
                right_node: nil,
                value: 12
              },
              node_name: :negacion_logica,
              right_node: nil,
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        }, []}
     ],
      tokens_addsem3: [%AST{
        left_node: %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: nil,
                node_name: :constante,
                right_node: nil,
                value: 1
              },
              node_name: :suma,
              right_node: %AST{
                left_node: nil,
                node_name: :constante,
                right_node: nil,
                value: 2
              },
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion, 
          right_node: nil,
          value: :main
        },
        node_name: :program,
        right_node: nil, 
        value: nil
      }
      ],
      tokens_aso: [%AST{
        left_node: %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 1
                },
                node_name: :resta,
                right_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 2 
                },
                value: nil
              },
              node_name: :resta,
              right_node: %AST{
                left_node: nil,
                node_name: :constante,
                right_node: nil,
                value: 3
              },
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        },
        node_name: :program,
        right_node: nil,
        value: nil
      }
      ],
      tokens_aso2: [
        %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: %AST{
                    left_node: nil,
                    node_name: :constante,
                    right_node: nil,
                    value: 6
                  },
                  node_name: :division,
                  right_node: %AST{
                    left_node: nil,
                    node_name: :constante,
                    right_node: nil,
                    value: 3
                  },
                  value: nil
                },
                node_name: :division,
                right_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 2
                },
                value: nil
              },
              node_name: :return,
              right_node: nil,
              value: nil
            },
            node_name: :funcion,
            right_node: nil,
            value: :main
          },
          node_name: :program,
          right_node: nil,
          value: nil
        }
      ],
      tokens_div: [
        %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 4
                },
                node_name: :division,
                right_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 2
                },
                value: nil
              },
              node_name: :return,
              right_node: nil,
              value: nil
            },
            node_name: :funcion,
            right_node: nil,
            value: :main
          },
          node_name: :program,
          right_node: nil,
          value: nil
        }
      ],
      tokens_mult: [
        %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 2
                },
                node_name: :multiplicacion,
                right_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 3
                },
                value: nil
              },
              node_name: :return,
              right_node: nil,
              value: nil
            },
            node_name: :funcion,
            right_node: nil,
            value: :main
          },
          node_name: :program,
          right_node: nil,
          value: nil
        }
      ],
      tokens_parens: [
        %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 2
                },
                node_name: :multiplicacion,
                right_node: %AST{
                  left_node: %AST{
                    left_node: nil,
                    node_name: :constante,
                    right_node: nil,
                    value: 3
                  },
                  node_name: :suma,
                  right_node: %AST{
                    left_node: nil,
                    node_name: :constante,
                    right_node: nil,
                    value: 4
                  },
                  value: nil
                },
                value: nil
              },
              node_name: :return,
              right_node: nil,
              value: nil
            },
            node_name: :funcion,
            right_node: nil,
            value: :main
          },
          node_name: :program,
          right_node: nil,
          value: nil
        }
      ],

    tokens_precedence: [
      %AST{
        left_node: %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: nil,
                node_name: :constante,
                right_node: nil,
                value: 2
              },
              node_name: :suma,
              right_node: %AST{
                left_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 3
                },
                node_name: :multiplicacion,
                right_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 4
                },
                value: nil
              },
              value: nil
            },
            node_name: :return,
            right_node: nil,
            value: nil
          },
          node_name: :funcion,
          right_node: nil,
          value: :main
        },
        node_name: :program,
        right_node: nil,
        value: nil
      }
      ],
      tokens_sub: [
        %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 1
                },
                node_name: :resta,
                right_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 2
                },
                value: nil
              },
              node_name: :return,
              right_node: nil,
              value: nil
            },
            node_name: :funcion,
            right_node: nil,
            value: :main
          },
          node_name: :program,
          right_node: nil,
          value: nil
        }
      ],
      tokens_subneg: [
        %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 2
                },
                node_name: :resta,
                right_node: %AST{
                  left_node: %AST{
                    left_node: nil,
                    node_name: :constante,
                    right_node: nil,
                    value: 1
                  },
                  node_name: :negacion,
                  right_node: nil,
                  value: nil
                },
                value: nil
              },
              node_name: :return,
              right_node: nil,
              value: nil
            },
            node_name: :funcion,
            right_node: nil,
            value: :main 
          },
          node_name: :program,
          right_node: nil,
          value: nil
        }
      ],
      tokens_unop_add: [
        %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: %AST{
                    left_node: nil,
                    node_name: :constante,
                    right_node: nil,
                    value: 2
                  },
                  node_name: :complemento,
                  right_node: nil,
                  value: nil
                },
                node_name: :suma,
                right_node: %AST{
                  left_node: nil,
                  node_name: :constante,
                  right_node: nil,
                  value: 3
                },
                value: nil
              },
              node_name: :return,
              right_node: nil, 
              value: nil
            },
            node_name: :funcion,
            right_node: nil,
            value: :main
          },
          node_name: :program,
          right_node: nil,
          value: nil
        }
      ],
      tokens_unopparens: [
        %AST{
          left_node: %AST{
            left_node: %AST{
              left_node: %AST{
                left_node: %AST{
                  left_node: %AST{
                    left_node: nil,
                    node_name: :constante,
                    right_node: nil,
                    value: 1
                  },
                  node_name: :suma,
                  right_node: %AST{
                    left_node: nil,
                    node_name: :constante,
                    right_node: nil,
                    value: 1
                  },
                  value: nil
                },
                node_name: :complemento,
                right_node: nil,
                value: nil
              },
              node_name: :return,
              right_node: nil,
              value: nil
            },
            node_name: :funcion,
            right_node: nil,
            value: :main
          },
          node_name: :program,
          right_node: nil,
          value: nil
        }
      ], 

      tokens_and_neg: [
      	%AST{
		  left_node: %AST{
		    left_node: %AST{
		      left_node: %AST{
		        left_node: %AST{
		          left_node: nil,
		          node_name: :constante,
		          right_node: nil,
		          value: 1
		        },
		        node_name: :ampersand,
		        right_node: %AST{
		          left_node: nil,
		          node_name: :constante,
		          right_node: nil,
		          value: 0
		        },
		        value: nil
		      },
		      node_name: :return,
		      right_node: nil,
		      value: nil
		    },
		    node_name: :funcion,
		    right_node: nil,
		    value: :main
		  },
		  node_name: :program,
		  right_node: nil,
		  value: nil
		}
      ], 

      tokens_and_true: [
      	%AST{
		  left_node: %AST{
		    left_node: %AST{
		      left_node: %AST{
		        left_node: %AST{
		          left_node: nil,
		          node_name: :constante,
		          right_node: nil,
		          value: 1
		        },
		        node_name: :ampersand,
		        right_node: %AST{
		          left_node: %AST{
		            left_node: nil,
		            node_name: :constante,
		            right_node: nil,
		            value: 1
		          },
		          node_name: :negacion,
		          right_node: nil,
		          value: nil
		        },
		        value: nil
		      },
		      node_name: :return,
		      right_node: nil,
		      value: nil
		    },
		    node_name: :funcion,
		    right_node: nil,
		    value: :main
		  },
		  node_name: :program,
		  right_node: nil,
		  value: nil 
		}
      ],

      tokens_eq_true: [
      	%AST{
		  left_node: %AST{
		    left_node: %AST{
		      left_node: %AST{
		        left_node: %AST{
		          left_node: nil,
		          node_name: :constante,
		          right_node: nil,
		          value: 1
		        },
		        node_name: :igual_a,
		        right_node: %AST{
		          left_node: nil,
		          node_name: :constante,
		          right_node: nil,
		          value: 1
		        },
		        value: nil
		      },
		      node_name: :return,
		      right_node: nil,
		      value: nil
		    },
		    node_name: :funcion,
		    right_node: nil,
		    value: :main
		  },
		  node_name: :program,
		  right_node: nil,
		  value: nil
		}
      ],

      tokens_eq_false: [
      	%AST{
    		  left_node: %AST{
    		    left_node: %AST{
    		      left_node: %AST{
    		        left_node: %AST{
    		          left_node: nil,
    		          node_name: :constante,
    		          right_node: nil,
    		          value: 1
    		        },
    		        node_name: :igual_a,
    		        right_node: %AST{
    		          left_node: nil,
    		          node_name: :constante,
    		          right_node: nil,
    		          value: 2
    		        },
    		        value: nil
    		      },
    		      node_name: :return,
    		      right_node: nil,
    		      value: nil
    		    },
    		    node_name: :funcion,
    		    right_node: nil,
    		    value: :main
    		  },
    		  node_name: :program,
    		  right_node: nil,
    		  value: nil
    		}
      ]
    }
  end

  ########## 1er semana - casos validos ########

  test " Retorna 2", state do
    expected_in =
      Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "return "], [2, "2;"], [3, "}"]], [])

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens]
  end

  test " Retorna Multi digito", state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main(){"], [2, "return "], [2, "100;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens_md]
  end

  test " Solo espaciado", state do
    expected_in =
      Lexer.lexer_principal(
        [
          [1, "int "],
          [1, "main"],
          [1, "("],
          [1, ")"],
          [1, "{"],
          [1, "return "],
          [1, "2"],
          [1, ";"],
          [1, "}"]
        ],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens]
  end

  test " Retorna 0", state do
    expected_in =
      Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "return "], [2, "0;"], [3, "}"]], [])

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens_0]
  end

  test " Solo saltos de linea", state do
    expected_in =
      Lexer.lexer_principal(
        [
          [1, "int "],
          [2, "main"],
          [3, "("],
          [4, ")"],
          [5, "{"],
          [6, "return "],
          [7, "2"],
          [8, ";"],
          [9, "}"]
        ],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens]
  end

  test " Sin saltos de linea", state do
    expected_in =
      Lexer.lexer_principal([[1, "int "], [1, "main(){"], [1, "return "], [1, "2;"], [1, "}"]], [])

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens]
  end

  ########## 1er semana - casos NO validos ########

  test " Falta punto y coma", _state do
    expected_in =
      Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "2"], [2, ";"], [3, "}"]], [])

    parser_out = [Parser.analizador_gramatica(expected_in)]
    #assert parser_out == [error: "Error: se esparaba ;"]
	 assert parser_out == [{{:error, "Linea: 2. Error: se esperaba punto y coma."}}]
    # IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
  end

  test " Faltan parentesis", _state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main"], [1, "{"], [2, "return "], [2, "2;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == [error: "Linea: 1. Error: se esparaba parentesis que abriera"]
  end

  test " Falta valor a retornar", _state do
    expected_in =
      Lexer.lexer_principal([[1, "int "], [1, "main(){"], [2, "return "], [2, ";"], [3, "}"]], [])

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == [error: "Linea: 1. Error: la funcion no devuelve nada"]
    # IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
  end

  test " Falta cerrar parentesis", _state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main("], [1, "{"], [2, "return "], [2, "2;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == [error: "Linea: 1. Error: se esparaba parentesis que cerrara"]
  end

  ########## 2da semana - casos validos ########

  test " Diferente de cero", state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "!0;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens_nz]
  end

  test " Diferente de cinco", state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "!5;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens_nc]
  end

  test " Nested ops", state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "!-3;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens_no]
  end

  test " Nested ops 2", state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "-~0;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens_no2]
  end

  test " Negacion", state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "-5;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens_neg]
  end

  test " Bitwise 0", state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "~0;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens_b0]
  end

  test " Bitwise", state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "!12;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    assert parser_out == state[:tokens_b]
  end

  ########## 2da semana - casos NO validos ########

  test " Orden erroneo", _state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "4-;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    #assert parser_out == [error: "Error: unario no valido"]
	assert parser_out == [error: "Linea: 2. Error: Orden de operandos erroneos"]
    # IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
  end

  test " Falta constante", _state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "!~;"], [3, "}"]],
        []
      )

    parser_out = [Parser.funcion_parser(expected_in)]
    # IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
    assert parser_out == [error: "Linea: 1. Error: la funcion no devuelve nada"]
  end

  test " Falta constante 2", _state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int "], [1, "main()"], [1, "{"], [2, "return "], [2, "!;"], [3, "}"]],
        []
      )
    parser_out = [Parser.funcion_parser(expected_in)]
    # IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
    assert parser_out == [error: "Linea: 1. Error: la funcion no devuelve nada"]
  end

# ########## Semana 3 casos validos ###############

  test " Suma", state do
    expected_in =
      Lexer.lexer_principal(
        [[1, "int main() {"], [2, "    return 1 + 2;"], [3, "}"]],
        []
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_addsem3]
  end

  test " Asociatividad", state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 1 - 2 - 3;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_aso]    
  end

  test " Asociatividad 2", state do
    expected_in = 
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 6 / 3 / 2;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_aso2]
  end

  test " Division", state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 4 / 2;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_div]
  end

  test " Multiplicacion", state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 2 * 3;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_mult]
  end

  test " Operaciones con parentesis", state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 2 * (3 + 4);"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_parens]
  end

  test " Prescedencia", state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 2 + 3 * 4;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_precedence]
  end

  test " Resta", state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 1 - 2;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_sub]
  end

  test " Resta negada", state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 2- -1;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_subneg]
  end

  test " Suma y complemento", state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return ~2 + 3;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_unop_add]
  end

  test " Parentesis y complemento", state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return ~(1 + 1);"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    assert parser_out == state[:tokens_unopparens]
  end

######### Semana 3 casos NO validos #######

  test " Parentesis mal formado", _state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 2 (- 3);"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    #IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
    assert parser_out == [error: "Error: Falla en los operandos"]
  end

  test " Falta el primer operando", _state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return /3;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    #IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
    assert parser_out == [error: "Error: Falla en los operandos"]
  end

  test " Falta el segundo operando", _state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 1 + ;"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    #IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
    assert parser_out == [error: "Error: Falla en los operandos"]
  end

  test " Falta el punto y coma semana 3", _state do
    expected_in =
      Lexer.lexer_principal([[1, "int main() {"], [2, "    return 2*2"], [3, "}"]],[]
      )
    parser_out = [Parser.programa_parser(expected_in)]
    #IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
    assert parser_out == [error: "Error: Falla en los operandos"]
  end

#   ######### Casos validos semana 4 ##########

  test " And falso sem 4", state do
  	expected_in = 
  	Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 && 0;"], [3, "}"]], []
  	)
  	parser_out = [Parser.programa_parser(expected_in)]
  	assert parser_out == state[:tokens_and_neg]
  end

  test " And verdadero sem 4", state do
  	expected_in = 
  		Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 && -1;"], [3, "}"]], []
  		)
	parser_out = [Parser.programa_parser(expected_in)]
	assert parser_out == state[:tokens_and_true]
  end

  test " Igual verdadero sem 4", state do
  	expected_in =
  	Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 == 1;"], [3, "}"]], []
  		)
  	parser_out = [Parser.programa_parser(expected_in)]
  	assert parser_out == state[:tokens_eq_true]
  end

  test " Falso igual sem 4", state do
  	expected_in = 
  	Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 == 2;"], [3, "}"]], []
  		)
  	parser_out = [Parser.programa_parser(expected_in)]
  	assert parser_out == state[:tokens_eq_false]
  end

  test " Falso mayor igual semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 >= 2;"], [3, "}"]], []
      )
    _parse_out = [Parser.programa_parser(expected_in)]
  #  assert _parse_out == state[:tokens_ge_false]
  end

  test " Verdadero mayor igual semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 >= 1;"], [3, "}"]], []
      )
    _parse_out = [Parser.programa_parser(expected_in)]
  #  assert _parse_out == state[:tokens_ge_true]
  end

  test " Falso mayor a semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 > 2;"], [3, "}"]], []
      )
    _parse_out = [Parser.programa_parser(expected_in)]
  #  assert _parse_out == state[:tokens_gt_false]
  end

  test " Verdadero mayor a semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 > 0;"], [3, "}"]], []
      )
    _parse_out = [Parser.programa_parser(expected_in)]
  #  assert _parse_out == state[:tokens_gt_true]
  end

  test " Falso menor igual a semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 <= -1;"], [3, "}"]], []
      )
    _parse_out = [Parser.programa_parser(expected_in)]
  #  assert _parse_out == state[:tokens_le_false]
  end

  test " Verdadero menor igual a semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 0 <= 2;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_le_true]
  end

  test " Falso menor a, semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 2 < 1;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_lt_false]
  end

  test " Verdadero menor a, semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 < 2;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_lt_true]
  end

  test " Falso Diferente de, semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 0 != 0;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_ne_false]
  end

  test " Verdadero Diferente de, semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return -1 != -2;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_ne_true]
  end

  test " Prescedencia semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 || 0 && 2;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_precedenceS4]
  end

  test " Prescedencia 2 semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return (1 || 0) && 0;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_precedence2S4]
  end

  test " Prescedencia 3 semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 2 == 2 > 0;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_precedence3S4]
  end

  test " Prescedencia 4 semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 2 == 2 || 0;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_precedence4S4]
  end

  test " Or Verdadero semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 || 0;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_or_true]
  end

  test " Or Falso semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 0 || 0;"], [3, "}"]], []
      )
    _parser_out = [Parser.programa_parser(expected_in)]
  #  assert parser_out == state[:tokens_or_false]
  end

########## Casos no validos semana 4 ############

  test " Falta primer operando semana 4", _state do
  	expected_in = 
  	Lexer.lexer_principal([[1, "int main() {"], [2, "return <= 2;"], [3, "}"]], []
  		)
  	parser_out = [Parser.programa_parser(expected_in)]
  	##assert parser_out
  	#IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
    assert parser_out == [error: "Error: Falla en los operandos"]
  end

  test " Falta operando de en medio semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 < > 3;"], [3, "}"]], []
      )
    parser_out = [Parser.programa_parser(expected_in)]
    #IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
    assert parser_out == [ error: "Error: Falla en los operandos"]
  end

  test " Falta punto y coma semana 4", _state do
    expected_in =
    Lexer.lexer_principal([[1, "int main() {"], [2, "return 1 || 2"], [3, "}"]], []
      )
    parser_out = [Parser.programa_parser(expected_in)]
    #IO.inspect(parser_out, label: "\nSalida Parser (arbolast) \n")
    assert parser_out == [error: "Error: Falla en los operandos"]
  end

end
