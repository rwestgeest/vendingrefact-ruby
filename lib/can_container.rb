#
# (c) Quality Without A Name 2011
#     Refactoring Course material
#
#
# this is the container of cans
# 
class CanContainer
  def type=(t)
    @the_type = t
  end

  def type
    return @the_type
  end

  def price=(p) 
    @p = p
  end

  def price
    @p
  end

  def amount=(amount)
    @amount = amount
  end

  def amount()
    return @amount
  end
end


