#
# (c) Quality Without A Name 2011
#     Refactoring Course material
#
require 'enum'

class Can < Enum
  values :none, :cola, :fanta, :sprite
end

class Choice < Enum
  values :cola, :fanta, :sprite, :beer
end


