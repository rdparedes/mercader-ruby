class Metal

    attr_accessor :name, :value

    def initialize(name, value)
        if !/[[:upper:]]/.match(name[0])
            raise ArgumentError.new("First letter must be uppercase.")
        end
        
        @name = name
        @value = value
    end

end