#
# (c) Quality Without A Name 2011
#     Refactoring Course material
#
require File.join(File.dirname(__FILE__),'test_helper')
require 'enum'

class EnumTest < Test::Unit::TestCase
  class MyEnum < Enum
    values :first, :second
  end
  
  def test_enum_value_is_accessible_with_class_method
    assert_nothing_raised do 
      MyEnum.first
    end
  end
  
  def test_non_existing_value_raises_exception
    assert_raises RuntimeError do 
      MyEnum.blah
    end
  end
  
  def test_enum_values_are_exactly_same
      assert_same MyEnum.first, MyEnum.first
  end
  
  def test_different_enum_values_are_exactly_same
      assert_not_same MyEnum.second, MyEnum.first
  end
  
  def test_inspecting_a_value_returns_a_readable_string
      assert_equal 'EnumTest::MyEnum.first', MyEnum.first.inspect
  end
end
