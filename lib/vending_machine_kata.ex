defmodule VendingMachine do

  defstruct total: 0, coin_return: []

  def insert_coin(vending_machine, coin) do
    coin_value = determine_coin_value(coin.weight_in_grams)

    new_coin_return = case coin_value do
      0 -> [coin | vending_machine.coin_return]
      not_zero -> []
    end

    %VendingMachine{
      total: vending_machine.total + coin_value,
      coin_return: new_coin_return
    }
  end

  defp determine_coin_value(coin_weight) do
    case coin_weight do
      5 -> 0.05
      2.268 -> 0.10
      5.67 -> 0.25
      invalid_coin -> 0
    end
  end
end
