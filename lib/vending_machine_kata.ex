defmodule VendingMachine do

  def insert_coin(vending_machine, coin) do
    if(coin.weight_in_grams == 5) do
      new_total = vending_machine.total + 0.05
      %{total: new_total}
    end
    
  end

end
