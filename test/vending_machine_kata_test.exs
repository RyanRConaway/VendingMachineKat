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

  test "Can accept a single quarter" do
    vending_machine = %{
      total: 0
    }

    quarter = %{
      weight_in_grams: 5.67
    }

    result = VendingMachine.insert_coin(vending_machine, quarter)

    assert result.total == 0.25
  end

  test "Does not increment vending machine total when unknown coin is inserted" do
    vending_machine = %{
      total: 0,
      coin_return: []
    }

    unknown_coin = %{
      weight_in_grams: 1.337
    }

    result = VendingMachine.insert_coin(vending_machine, unknown_coin)

    assert result.total == 0
  end

  test "When coin is rejected, place coin in the coin return" do
    vending_machine = %{
      total: 0,
      coin_return: []
    }

    unknown_coin = %{
      weight_in_grams: 1.337
    }

    result = VendingMachine.insert_coin(vending_machine, unknown_coin)

    assert result.coin_return == [unknown_coin]
  end

  test "When multiple coins are rejected, place each coin in the coin return" do
    vending_machine = %{
      total: 0,
      coin_return: []
    }

    unknown_coin = %{
      weight_in_grams: 1.337
    }

    result = vending_machine
      |> VendingMachine.insert_coin(unknown_coin)
      |> VendingMachine.insert_coin(unknown_coin)

    assert result.coin_return == [unknown_coin, unknown_coin]
  end



end
