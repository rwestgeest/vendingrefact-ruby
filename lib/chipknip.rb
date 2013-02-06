#
# (c) Quality Without A Name 2011
#     Refactoring Course material
#
class Chipknip
  attr_reader :credits
  def initialize(initial_value)
    @credits = initial_value
  end
  def reduce(amount)
    @credits -= amount
  end
  def has_value?(value)
    credits >= value
  end
end
