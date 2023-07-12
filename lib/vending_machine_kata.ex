defmodule VendingMachine do

  def insert_coin(vending_machine, coin) do
    if(coin.weight_in_grams == 5) do
      %{total: 0.05}
    end
  end

end
