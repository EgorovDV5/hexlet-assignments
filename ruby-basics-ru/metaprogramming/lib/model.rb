# frozen_string_literal: true

# BEGIN
module Model

    def self.included(base)
      base.extend ClassMethods
    end
  
    def initialize(attributes = {})
      set_attributes(attributes)
    end

    def attributes
      self.instance_variables.each_with_object({}) { |variable, attributes| 
        name = variable[1..-1]
        attributes[name.to_sym] = send("#{name}") }
    end

    module ClassMethods
      
      def attribute(name, options = {})
        
        type = options.fetch(:type, nil)
        default = options.fetch(:default, nil)

        instance_variable_set "@#{name}", default
        
        # Get
        define_method name do
          value = instance_variable_get "@#{name}"
          coerce(value, type)
        end
        # Set
        define_method "#{name}=" do |value|
          instance_variable_set "@#{name}", value
        end
        
      end
      
    end
  
    private 
    def set_attributes(attributes)
      self.class.instance_variables.each { |variable| 
        name = variable[1..-1]
        default = self.class.instance_variable_get "@#{name}"
        send("#{name}=", default)
        }
      
      attributes.each_pair { |name, value| send("#{name}=", value) }
    end
  
    def coerce(value, type)
      return value if type.nil?
      return nil if value.nil?
      
      case type.to_s.capitalize
        when "String" then value.to_s
        when "Boolean" then
            if value.is_a?(TrueClass) || value.is_a?(FalseClass)
                value
            elsif value.is_a?(NilClass)
                false
            else
                value.to_s.downcase == "true" || value.to_s.downcase == "1"
            end
        when "Integer" then value.to_i
        when "Datetime" then DateTime.parse(value)
        else value
      end
    end
  
  end
# END
