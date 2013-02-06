#
# (c) Quality Without A Name 2011
#     Refactoring Course material
#
class Enum
    def initialize(type)
        @type = type
    end
    def inspect
        return "#{self.class.name}.#{@type}"
    end
    def self.method_missing(method)
      begin
        self.send('class_variable_get',"@@#{method}")
      rescue 
        raise "Enum constant '#{method}' not defined in #{self}"
      end
    end
    def self.values(*values)
        values.each{|value| send('class_variable_set',"@@#{value}", new(value.to_s))}
    end
end
