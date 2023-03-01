# frozen_string_literal: true

# BEGIN
require 'date'

module Model

    def self.included(base)
      base.attr_reader :attributes
      base.extend ClassMethods
    end
  
    def initialize(attrs = {})
      @attributes = {}
      set_attributes(attrs)
    end

    module ClassMethods

      def attribute_options
        @attribute_options || {}
      end
      
      def attribute(name, options = {})
        @attribute_options ||= {}
        attribute_options[name] = options
        

        define_method :"#{name}" do
          @attributes[name]
        end

        define_method :"#{name}=" do |value|
          write_attribute(name, value)
        end
      end

      def convert(value, type)
        return value if value.nil?
        case type
          when :string then String value
          when :integer then Integer value
          when :datetime then DateTime.parse value
          when :boolean then !!value
          else value
        end
      end
      
    end

    def write_attribute(name, value)
      options = self.class.attribute_options[name]
      @attributes[name] = self.class.convert(value, options[:type])
    end
  
    private 
    def set_attributes(attrs)
      self.class.attribute_options.each do |name, options|
        default = options.fetch(:default, nil)
        value = attrs.key?(name) ? attrs[name] : default
        write_attribute(name, value)
      end
    end

  end
# END
