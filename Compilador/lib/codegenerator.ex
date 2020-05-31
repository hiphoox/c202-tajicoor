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
  Require Agent
  """

  def holaMundo do
    IO.puts "Hallo Welt"
  end


  def create(codigo) do
    {:ok, agent} = Agent.start_link(fn -> 1 end)

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
                  cadena = acc <> expresion(expr, agent)
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

  def expresion(expr, procesoAgente) do
    cadena=""
    case expr do
      {:opUnario,"negation",expr} ->
        cadena = cadena <> expresion(expr,procesoAgente)
        cadena = cadena <> "  neg %eax\n"
        cadena
      {:opUnario,"bwComp",expr} ->
        cadena = cadena <> expresion(expr,procesoAgente)
        cadena = cadena <> "  not %eax\n"
        cadena
      {:opUnario,"logNeg",expr} ->
        cadena = cadena <> expresion(expr,procesoAgente)
        cadena = cadena <> "  cmpl $0, %eax\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  sete %al\n"
        cadena
      {:opBinario,"+",expr1,expr2} ->
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  push %eax\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  addl %ecx, %eax\n"
        cadena
      {:opBinario,"*",expr1,expr2} ->
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  push %eax\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  imul %ecx, %eax\n"
        cadena
      {:opBinario,"-",expr1,expr2} ->
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  push %eax\n"
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  subl %ecx, %eax\n"
        cadena
      {:opBinario,"/",expr1,expr2} ->
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  movl %eax,%ebx\n"
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  cdq\n"
        cadena = cadena <> "  idivl %ebx\n"
        cadena
      {:opBinario,"==",expr1,expr2} ->
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  push %eax\n"
        #cadena = cadena <> "  movl %eax,%ebx\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  cmpl %eax, %ecx\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  sete %al\n"
        cadena
      {:opBinario,"!=",expr1,expr2} ->
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  push %eax\n"
        #cadena = cadena <> "  movl %eax,%ebx\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  cmpl %eax, %ecx\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  setne %al\n"
        cadena
      {:opBinario,">=",expr1,expr2} ->
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  push %eax\n"
        #cadena = cadena <> "  movl %eax,%ebx\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  cmpl %eax, %ecx\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  setge %al\n"
        cadena
      {:opBinario,"<=",expr1,expr2} ->
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  push %eax\n"
        #cadena = cadena <> "  movl %eax,%ebx\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  cmpl %eax, %ecx\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  setae %al\n"
        cadena
      {:opBinario,"||",expr1,expr2} ->
        Agent.update(procesoAgente, fn (state) -> state + 1 end)
        #IO.puts "Intento #{inspect procesoAgente}. Valor: #{Agent.get(procesoAgente, &(&1))}"
        aux = Agent.get(procesoAgente, &(&1))        
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  cmpl $0, %eax\n"
        cadena = cadena <> "  je _orJump#{aux}\n"
        cadena = cadena <> "  movl $1, %eax\n"
        cadena = cadena <> "  jmp _orEnd#{aux}\n"
        cadena = cadena <> "_orJump#{aux}:\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  cmpl $0, %eax\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  setne %al\n"
        cadena = cadena <> "_orEnd#{aux}:\n"
        cadena
      {:opBinario,"&&",expr1,expr2} ->
        Agent.update(procesoAgente, fn (state) -> state + 1 end)
        IO.puts "Intento #{inspect procesoAgente}. Valor: #{Agent.get(procesoAgente, &(&1))}"
        aux = Agent.get(procesoAgente, &(&1))        
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  cmpl $0, %eax\n"
        cadena = cadena <> "  jne _andJump#{aux}\n"
        cadena = cadena <> "  jmp _andEnd#{aux}\n"
        cadena = cadena <> "_andJump#{aux}:\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  cmpl $0, %eax\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  setne %al\n"
        cadena = cadena <> "_andEnd#{aux}:\n"
        cadena
      {:opBinario,">",expr1,expr2} ->
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  push %eax\n"
        #cadena = cadena <> "  movl %eax,%ebx\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  cmpl %eax, %ecx\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  setg %al\n"
        cadena
      {:opBinario,"<",expr1,expr2} ->
        cadena = cadena <> expresion(expr1,procesoAgente)
        cadena = cadena <> "  push %eax\n"
        #cadena = cadena <> "  movl %eax,%ebx\n"
        cadena = cadena <> expresion(expr2,procesoAgente)
        cadena = cadena <> "  pop %ecx\n"
        cadena = cadena <> "  cmpl %eax, %ecx\n"
        cadena = cadena <> "  movl $0, %eax\n"
        cadena = cadena <> "  seta %al\n"
        cadena

        #https://books.google.com.mx/books?id=F5MhjlEnnO0C&pg=PA363&lpg=PA363&dq=sete+setne+setge+setl+greater+than&source=bl&ots=WDzJP_MBbh&sig=ACfU3U0Y_bkVKU26oftGhgD0scSa8YrbyQ&hl=es-419&sa=X&ved=2ahUKEwiU3pXj9tfpAhUEX60KHT0BCRwQ6AEwAHoECAoQAQ#v=onepage&q=sete%20setne%20setge%20setl%20greater%20than&f=false
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
