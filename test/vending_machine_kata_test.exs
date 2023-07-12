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

    result = vending_machine
      |> VendingMachine.insert_coin(nickle)
      |> VendingMachine.insert_coin(nickle)

    assert result.total == 0.10
  end

  test "Can accept a single dime" do
    vending_machine = %{
      total: 0
    }

    dime = %{
      weight_in_grams: 2.268
    }

    result = VendingMachine.insert_coin(vending_machine, dime)

    assert result.total == 0.10
  end

end
