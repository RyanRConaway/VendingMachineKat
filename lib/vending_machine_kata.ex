defmodule VendingMachine do

  def insert_coin(vending_machine, coin) do

    coin_value =
      case coin.weight_in_grams do
        5 -> 0.05
        2.268 -> 0.10
      end

    %{total: vending_machine.total + coin_value}
  end

end
