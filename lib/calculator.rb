require_relative('metal')


class Calculator

    attr_accessor :units_mapping
    
    @@ROMAN_VALUES_MAPPING = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }

    def initialize(units_mapping=nil)
        @units_mapping = units_mapping ? units_mapping : {}
        @romans_regex = /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/
    end

    def add_intergallactic_unit(roman_value, name)
        if @units_mapping.key?(roman_value)
            @units_mapping[roman_value] = name 
        end
    end

    def translate_intergallactic_units(intergallactic_units)
        quantity_in_romans = ""
        begin
            intergallactic_units.split(" ").each do |unit|
                quantity_in_romans += @units_mapping.key(unit)
            end
            return convert_romans_to_quantity(quantity_in_romans)

        rescue Exception => e
            puts e.message
            puts "There was an error while trying to translate intergallactic units"
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