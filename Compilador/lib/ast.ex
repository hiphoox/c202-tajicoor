defmodule Ast do
  @moduledoc """
  Documentation for `Ast`.
  """

  @doc """
  Modulo para manejar el AST

  ## Examples

      


  """


  def validar(ast) do
    if is_list(ast) do
      Enum.any?(ast,fn(elem) -> validar(elem) end)
    else
      case ast do
        {:function,_tipo,_id,_param,states} ->
          Enum.any?(states,fn(elem) -> validar(elem) end)
          #validar(states)
        {:return,expr} ->
          validar(expr)
        {:int,_valor} ->
          false
        {:error,_mensaje,_tok} -> true
        _ -> false
      end
    end
  end


end
