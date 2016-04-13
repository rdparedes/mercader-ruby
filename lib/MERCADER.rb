require_relative('io_handler')
require_relative('calculator')


class Mercader

    @@units_mapping = {
        "I" => nil,
        "V" => nil,
        "X" => nil,
        "L" => nil,
        "C" => nil,
        "D" => nil,
        "M" => nil
    }

    def initialize
        @calculator = Calculator.new(@@units_mapping)
        @output = []

        @add_intergallactic_unit_regex = /^\b(?!is\b)\w+ is ([IVXLCDM])$/
        @create_metal_regex = /^(\b(?!is\b)[a-z]+\s?)+ [A-Z][a-z]* is (\d)+ Credits$/
        @calculate_value_regex = /^how much is (\b(?!is\b)[a-z]+\s?)+ \?$/
        @calculate_metal_value_regex = /^how many Credits is (\b(?!is\b)[a-z]+\s?)+ [A-Z][a-z]* \?$/
    end

    def calculate(input_file_path, output_file_path)
        input_text = IOHandler.read_file(input_file_path)
        input_lines = IOHandler.get_lines_from_string(input_text)

        begin
            input_lines.each do |input_line|

                if input_line.match(@add_intergallactic_unit_regex)
                    roman_value = input_line.split(" ")[-1]
                    name = input_line.split(" ")[0]
                    @calculator.add_intergallactic_unit(roman_value, name)

                elsif input_line.match(@create_metal_regex)
                    intergallactic_units = []
                    name = input_line.split(" ")[-4]
                    value = input_line.split(" ")[-2] / 
                        @calculator.translate_intergallactic_units(intergallactic_units)
                    metal = Metal.new(name, value)

                elsif input_line.match(@calculate_value_regex)
                    @calculator.translate_intergallactic_units(intergallactic_units)

                elsif input_line.match(@calculate_metal_value_regex)
                    @calculator.translate_intergallactic_units(intergallactic_units) * metal.value
                
                else
                    @output.push("I have no idea what you are talking about")
                
                end

            end
        rescue Exception => e
            @output.push("I have no idea what you are talking about")
        end

        IOHandler.write_file(output_file_path, @output.join("\n"))
    end
end
