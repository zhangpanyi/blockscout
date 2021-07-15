defmodule BlockScoutWeb.ChainView do
  use BlockScoutWeb, :view

  import Number.Currency, only: [number_to_currency: 1, number_to_currency: 2]

  alias BlockScoutWeb.LayoutView

  def format_usd_value(value) do
    "#{format_currency_value(value)} USD"
  end

  defp format_currency_value(value, symbol \\ "$")

  defp format_currency_value(value, symbol) when value < 0 do
    "#{symbol}0.000000"
  end

  defp format_currency_value(value, symbol) when value < 0.000001 do
    "Less than #{symbol}0.000001"
  end

  defp format_currency_value(value, _symbol) when value < 1 do
    "#{number_to_currency(value, precision: 6)}"
  end

  defp format_currency_value(value, _symbol) when value < 100_000 do
    "#{number_to_currency(value)}"
  end

  defp format_currency_value(value, _symbol) do
    "#{number_to_currency(value, precision: 0)}"
  end
end
