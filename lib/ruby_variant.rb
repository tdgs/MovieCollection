class Qt::RubyVariant < Qt::Variant
    attr_accessor :value
    def initialize(value)
        super()
        @value = value
    end
end
 
class Object
    def to_variant
        puts 'to variant!'
        Qt::RubyVariant.new self
    end
end
