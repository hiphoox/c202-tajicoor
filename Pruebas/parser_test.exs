defmodule ParserTest do
  use ExUnit.Case
  doctest parser
  doctest lexer

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

  ########## entrega 1 - casos validos ########

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

  ########## entrega 1 - casos NO validos ########

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
end