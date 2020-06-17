defmodule Gcc do
  @moduledoc """
  Documentation for `Gcc`.
  """

  @doc """
  Modulo para manejar el Gcc

  ## Examples

      #iex> Gcc.hola()
      #"Limpiando // Funcion incompleta"

  require Kernel

  """

  def hola() do
    IO.puts "GCC"
  end

  def exeCreator(nombreEjecutable \\ "a.out") do
    if (nombreEjecutable=="" || nombreEjecutable==nil) do
      System.cmd("gcc",["-m32","assembler.s","-o","a.out"])
      IO.puts "Executable 'a.out' created"
    else
      nombreEjecutable2 = String.slice(Kernel.inspect(nombreEjecutable),1..String.length(Kernel.inspect(nombreEjecutable))-2)
      System.cmd("gcc",["-m32","assembler.s","-o",nombreEjecutable2])
      IO.puts "Executable '#{nombreEjecutable2}' created"
    end

  end

end
