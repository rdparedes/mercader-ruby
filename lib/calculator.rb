class Calculator

    attr_accessor :roman_to_intergalactic_units_mapping
    
    @@ROMAN_VALUES_MAPPING = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }
    @@roman_to_intergalactic_units_mapping = {
        "I" => nil,
        "V" => nil,
        "X" => nil,
        "L" => nil,
        "C" => nil,
        "D" => nil,
        "M" => nil
    }

    def initialize(roman_to_intergalactic_units_mapping=nil)
        @roman_to_intergalactic_units_mapping = roman_to_intergalactic_units_mapping ? roman_to_intergalactic_units_mapping : @@roman_to_intergalactic_units_mapping
        @romans_regex = /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/
    end

    def add_intergalactic_unit(roman_value, name)
        if @roman_to_intergalactic_units_mapping.key?(roman_value)
            @roman_to_intergalactic_units_mapping[roman_value] = name 
        end
    end

    def translate_intergalactic_units(intergalactic_units)
        quantity_in_romans = ""
        begin
            intergalactic_units.split(" ").each do |unit|
                quantity_in_romans += @roman_to_intergalactic_units_mapping.key(unit)
            end
            return convert_romans_to_quantity(quantity_in_romans)

        rescue Exception => e
            puts e.message
            puts "There was an error while trying to translate intergalactic units"
        end
    end

    def convert_romans_to_quantity(romans)
        if !romans.match(@romans_regex)
            return -1
        end

        quantity = 0
        index = romans.length-1

        index.step(0, -2) do |index|
            current_pos_value = @@ROMAN_VALUES_MAPPING[romans[index]]

            if index == 0
                quantity += current_pos_value
                break
            end

            prev_pos_value = @@ROMAN_VALUES_MAPPING[romans[index-1]]

            if prev_pos_value == current_pos_value / 5 or
                prev_pos_value == current_pos_value / 10
                quantity += (current_pos_value - prev_pos_value)
            else
                quantity += (current_pos_value + prev_pos_value)
            end
        end

        return quantity
    end

end