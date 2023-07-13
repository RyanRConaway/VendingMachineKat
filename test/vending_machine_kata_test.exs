defmodule VendingMachineTest do
  use ExUnit.Case

  test "Can accept a single nickle" do
    vending_machine = %VendingMachine{
      total: 0
    }

    nickle = %{
      weight_in_grams: 5
    }

    result = VendingMachine.insert_coin(vending_machine, nickle)

    assert result.total == 0.05
  end

  test "Inserting a valid coin updates the display to shows the total" do
    vending_machine = %VendingMachine{
      total: 0
    }

    nickle = %{
      weight_in_grams: 5
    }

    result = VendingMachine.insert_coin(vending_machine, nickle)
    |> VendingMachine.check_display()

    assert result == "$0.05"
  end

  test "Can accept multiple nickles" do
    vending_machine = %VendingMachine{
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
    vending_machine = %VendingMachine{
      total: 0
    }

    dime = %{
      weight_in_grams: 2.268
    }

    result = VendingMachine.insert_coin(vending_machine, dime)

    assert result.total == 0.10
  end

  test "Can accept a single quarter" do
    vending_machine = %VendingMachine{}

    quarter = %{
      weight_in_grams: 5.67
    }

    result = VendingMachine.insert_coin(vending_machine, quarter)

    assert result.total == 0.25
  end

  test "Does not increment vending machine total when unknown coin is inserted" do
    vending_machine = %VendingMachine{}

    unknown_coin = %{
      weight_in_grams: 1.337
    }

    result = VendingMachine.insert_coin(vending_machine, unknown_coin)

    assert result.total == 0
  end

  test "When coin is rejected, place coin in the coin return" do
    vending_machine = %VendingMachine{}

    unknown_coin = %{
      weight_in_grams: 1.337
    }

    result = VendingMachine.insert_coin(vending_machine, unknown_coin)

    assert result.coin_return == [unknown_coin]
  end

  test "When multiple coins are rejected, place each coin in the coin return" do
    vending_machine = %VendingMachine{}

    unknown_coin = %{
      weight_in_grams: 1.337
    }

    result = vending_machine
      |> VendingMachine.insert_coin(unknown_coin)
      |> VendingMachine.insert_coin(unknown_coin)

    assert result.coin_return == [unknown_coin, unknown_coin]
  end

  test "When valid coin is given, coin_return retains its contents" do
    unknown_coin = %{
      weight_in_grams: 1.337
    }

    quarter = %{
      weight_in_grams: 5.67
    }

    vending_machine = %VendingMachine{
      coin_return: [unknown_coin]
    }

    result = VendingMachine.insert_coin(vending_machine, quarter)

    assert result.coin_return == [unknown_coin]
  end

  test "When there are no coins inserted, the machine displays INSERT COIN" do
    vending_machine = %VendingMachine{}

    result = VendingMachine.check_display(vending_machine)

    assert result == "INSERT COIN"
  end

  test "When there are coins inserted, the machine displays current vending machine total" do
    vending_machine = %VendingMachine{
      display: "$0.05"
    }

    result = VendingMachine.check_display(vending_machine)

    assert result == "$0.05"
  end

end
