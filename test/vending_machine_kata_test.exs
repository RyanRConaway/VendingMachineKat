defmodule VendingMachineTest do
  use ExUnit.Case

  test "Can accept nickles" do
    vending_machine = %{
      total: 0
    }

    nickle = %{
      weight_in_grams: 5
    }


    result = VendingMachine.insert_coin(vending_machine, nickle)

    assert result.total == 0.05
  end
end
