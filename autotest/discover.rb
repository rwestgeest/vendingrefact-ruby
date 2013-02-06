#
# (c) Quality Without A Name 2011
#     Refactoring Course material
#
# autotest/discover.rb
require File.dirname(__FILE__) + '/testunit'

Autotest.add_discovery { "testunit" }
