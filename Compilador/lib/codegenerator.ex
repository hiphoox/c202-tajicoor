defmodule CodeGenerator do
  @moduledoc """
  Documentation for `CodeGenerator`.
  """

  @doc """
  Modulo para manejar el CodeGenerator

  ## Examples

      #iex> CodeGenerator.holaMundo()
      #"Hallo Welt"

  Require Regex
  Require File
  """

  def holaMundo do
    IO.puts "Hallo Welt"
  end


  def create(codigo) do
    plantilla = 
" .globl main
main:
"
    if is_list(codigo) do
      aux = Enum.reduce(codigo,"",fn(elem,accMain) -> 
        case elem do
          {:function,_,_,_,statements} ->
            accMain <> Enum.reduce(statements,"",fn(state,acc) -> 
              case state do
                {:return,expr} ->
                  cadena = acc <> expresion(expr)
                  acc <> cadena <> "  ret\n"
                _ ->
                  cadena = acc <> "Error leyendo\n"
                  acc <> cadena
              end
            end)
          _ ->
            #IO.puts elem
            accMain <> "Error en CG"
        end
      end)
      aux = plantilla <> aux
      #aux = hd aux
      assemblerCreator(aux)
      aux
    else
      "De plano algo raro paso"
    end
  end

  def expresion(expr) do
    cadena=""
    case expr do
      {:opUnario,"negation",expr} ->
        cadena = cadena <> expresion(expr)
        cadena = cadena <> "  neg %eax\n"
        cadena
      {:opUnario,"bwComp",expr} ->
        cadena = cadena <> expresion(expr)
        cadena = cadena <> "  not %eax\n"
        cadena
      {:opUnario,"logNeg",expr} ->
        cadena = cadena <> expresion(expr)
        cadena = cadena <> "  cmpl $0, %eax\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  sete %al\n"
        cadena
      {:opBinario,"add",expr1,expr2} ->
        cadena = cadena <> expresion(expr1)
        cadena = cadena <> "  push %eax\n"
        cadena = cadena <> expresion(expr2)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  addl %ecx, %eax\n"
        cadena
      {:opBinario,"mult",expr1,expr2} ->
        cadena = cadena <> expresion(expr1)
        cadena = cadena <> "  push %eax\n"
        cadena = cadena <> expresion(expr2)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  imul %ecx, %eax\n"
        cadena
      {:opBinario,"subs",expr1,expr2} ->
        cadena = cadena <> expresion(expr1)
        cadena = cadena <> "  push %eax\n"
        cadena = cadena <> expresion(expr2)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  subl %ecx, %eax\n"
        cadena
      {:opBinario,"div",expr1,expr2} ->
        cadena = cadena <> expresion(expr2)
        cadena = cadena <> "  movl %eax,%ebx\n"
        cadena = cadena <> expresion(expr1)
        cadena = cadena <> "  cdq\n"
        cadena = cadena <> "  idivl %ebx\n"
        cadena

      {:int,valor} ->
        cadena = cadena <> "  movl $#{valor}, %eax\n"
        cadena
    end
  end

  def assemblerCreator(codigo) do
    case File.open("assembler.s",[:write]) do
      {:ok,file} ->
        IO.binwrite(file,codigo)
        IO.puts "Ensamblador creado"
        File.close(file)
      _ -> IO.puts "Error escribiendo el ensamblador"
    end
  end

end
