defmodule VendingMachineTest do
  use ExUnit.Case

  test "Can accept a single nickle" do
    vending_machine = %{
      total: 0
    }

    nickle = %{
      weight_in_grams: 5
    }


    result = VendingMachine.insert_coin(vending_machine, nickle)

    assert result.total == 0.05
  end

  test "Can accept multiple nickles" do
    vending_machine = %{
      total: 0
    }

    nickle = %{
      weight_in_grams: 5
    }


    vending_machine_after_first_nickel = VendingMachine.insert_coin(vending_machine, nickle)

    assert vending_machine_after_first_nickel.total == 0.05

    vending_machine_after_second_nickel = VendingMachine.insert_coin(vending_machine_after_first_nickel, nickle)

    assert vending_machine_after_second_nickel.total == 0.10
  end
end
