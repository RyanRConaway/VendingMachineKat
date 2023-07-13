defmodule VendingMachine do

  defstruct total: 0.00, coin_return: [], display:  "INSERT COIN"

  # Equal sign in function arguments are matchers, not assignments
  def insert_coin(vending_machine = %VendingMachine{}, coin) do
    coin_value = determine_coin_value(coin.weight_in_grams)

    new_coin_return = case coin_value do
      0.00 -> [coin | vending_machine.coin_return]
      not_zero -> vending_machine.coin_return
    end

    new_total = vending_machine.total + coin_value

    %VendingMachine{
      total: new_total,
      coin_return: new_coin_return,
      display: "$" <> Float.to_string(new_total)
    }
  end

  def insert_coin(vending_machine, coin) do
    raise "The object passed in as the Vending Machine is not a Vending Machine struct"
  end

  def check_display(vending_machine = %VendingMachine{}) do
    vending_machine.display
  end

  defp determine_coin_value(coin_weight) do
    case coin_weight do
      5 -> 0.05
      2.268 -> 0.10
      5.67 -> 0.25
      invalid_coin -> 0.00
    end
  end
end
