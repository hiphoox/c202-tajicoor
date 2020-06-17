import os

os.chdir("test_files")
#print(os.listdir())
directorios = [1,2,3,4]
print("defmodule CompiTajicoorTest do\n\
  use ExUnit.Case\n\
  doctest CompiTajicoor\n\
\n\
")
for i in directorios:
  os.chdir("stage_{}".format(i))
  os.chdir("invalid")
  archivos=os.listdir()
  cont=0
  for j in archivos:
    cont+=1
    programa=open(j,"r")
    lineas=programa.readlines()
    aux=""
    for k in lineas:
      aux+="    #{}".format(k)
    print("\n  test \"programa {} no valido de semana {}\" do\n{}\n    assert CompiTajicoor.pruebas(\"test_files/stage_{}/invalid/{}\") == :error\n  end".format(cont,i,aux,i,j))
    programa.close()
  os.chdir("..")

  os.chdir("valid")
  archivos=os.listdir()
  cont=0
  for j in archivos:
    cont+=1
    programa=open(j,"r")
    lineas=programa.readlines()
    aux=""
    for k in lineas:
      aux+="    #{}".format(k)
    print("\n  test \"programa {} valido de semana {}\" do\n{}\n    assert CompiTajicoor.pruebas(\"test_files/stage_{}/valid/{}\") == :ok\n  end".format(cont,i,aux,i,j))
    if (cont not in [8,18,6] and directorios != 4):
      print("\n  test \"programa {} valido de semana {}. Prueba de valor de retorno.\" do\n{}\n\n    assert CompiTajicoor.pruebaSalida(\"test_files/stage_{}/valid/{}\") == :ok\n  end".format(cont,i,aux,i,j))
    programa.close()
  os.chdir("..")
  os.chdir("..")
print("\nend")
