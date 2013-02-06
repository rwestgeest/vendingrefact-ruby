#
# (c) Quality Without A Name 2011
#     Refactoring Course material
#
require File.join(File.dirname(__FILE__),'test_helper')

require 'vending_machine'
require 'chipknip'

class VendingMachineTest < Test::Unit::TestCase
  attr_reader :machine
  def setup
    @machine = VendingMachine.new
  end
  
  def test_choiceless_machine_delivers_nothing
    assert_equal(Can.none, machine.deliver(Choice.cola))
    assert_equal(Can.none, machine.deliver(Choice.fanta))
  end

  def test_delivers_can_of_choice
    machine.configure(Choice.cola, Can.cola, 10)
    machine.configure(Choice.fanta, Can.fanta, 10)
    machine.configure(Choice.sprite, Can.sprite, 10)
    assert_equal(Can.cola, machine.deliver(Choice.cola))
    assert_equal(Can.fanta, machine.deliver(Choice.fanta))
    assert_equal(Can.sprite, machine.deliver(Choice.sprite))
  end
  
  def test_delivers_nothing_when_making_invalid_choice
    machine.configure(Choice.cola, Can.cola, 10)
    machine.configure(Choice.fanta, Can.fanta, 10)
    machine.configure(Choice.sprite, Can.sprite, 10)
    assert_equal(Can.none, machine.deliver(Choice.beer))
  end

  def test_delivers_nothing_when_not_paid
    machine.configure(Choice.fanta, Can.fanta, 10, 2)
    machine.configure(Choice.sprite, Can.sprite, 10, 1)

    assert_equal(Can.none, machine.deliver(Choice.fanta))
  end

  def test_delivers_fanta_when_paid
    machine.configure(Choice.sprite, Can.sprite, 10, 1)
    machine.configure(Choice.fanta, Can.fanta, 10, 2)

    machine.set_value(2)
    assert_equal(Can.fanta, machine.deliver(Choice.fanta))
    assert_equal(Can.none, machine.deliver(Choice.sprite))
  end

  def test_delivers_sprite_when_paid
    machine.configure(Choice.sprite, Can.sprite, 10, 1)
    machine.configure(Choice.fanta, Can.fanta, 10, 2)

    machine.set_value(2)
    assert_equal(Can.sprite, machine.deliver(Choice.sprite))
    assert_equal(Can.sprite, machine.deliver(Choice.sprite))
    assert_equal(Can.none, machine.deliver(Choice.sprite))
  end

  def test_add_payments
    machine.configure(Choice.sprite, Can.sprite, 10, 1)
    machine.configure(Choice.fanta, Can.fanta, 10, 2)

    machine.set_value(1)
    machine.set_value(1)
    assert_equal(Can.sprite, machine.deliver(Choice.sprite))
    assert_equal(Can.sprite, machine.deliver(Choice.sprite))
    assert_equal(Can.none, machine.deliver(Choice.sprite))
  end

  def test_returns_change
    machine.configure(Choice.sprite, Can.sprite, 10, 1)
    machine.set_value(2)
    assert_equal(2, machine.get_change())
    assert_equal(0, machine.get_change())
  end

  def test_stock
    machine.configure(Choice.sprite, Can.sprite, 1, 0)
    assert_equal(Can.sprite, machine.deliver(Choice.sprite))
    assert_equal(Can.none, machine.deliver(Choice.sprite))
  end

  def test_add_stock
    machine.configure(Choice.sprite, Can.sprite, 1, 0)
    machine.configure(Choice.sprite, Can.sprite, 1, 0)
    assert_equal(Can.sprite, machine.deliver(Choice.sprite))
    assert_equal(Can.sprite, machine.deliver(Choice.sprite))
    assert_equal(Can.none, machine.deliver(Choice.sprite))
  end

  def test_checkout_chip_if_chipknip_inserted
    machine.configure(Choice.sprite, Can.sprite, 1, 1)
    chip = Chipknip.new(10)
    machine.insert_chip(chip)
    assert_equal(Can.sprite, machine.deliver(Choice.sprite))
    assert_equal(9, chip.credits)
  end
  
  def test_checkout_chip_empty
    machine.configure(Choice.sprite, Can.sprite, 1, 1)
    chip = Chipknip.new(0)
    machine.insert_chip(chip)
    assert_equal(Can.none, machine.deliver(Choice.sprite))
    assert_equal(0, chip.credits)
  end
end
