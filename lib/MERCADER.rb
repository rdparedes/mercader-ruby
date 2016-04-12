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
    end

    def calculate(input_file_path, output_file_path)
        input_text = IOHandler.read_file(input_file_path)
        input_lines = IOHandler.get_lines_from_string(input_text)

        begin
            input_lines.each do |input_line|
                # Usar expresiones regulares
                if input_line.split(" ")[1] == "is"

                elsif input_line.split(" ")[-1] == "Credits"

                elsif 
            end
        rescue Exception => e
            @output.push("I have no idea what you are talking about")
        end

        IOHandler.write_file(output_file_path, output.join("\n"))
    end

    def read_line(input_line)
        # calculator = Calculator.new(@@units_mapping)
        #Grabar valores
        calculator.add_intergallactic_unit(roman_value, name)
        #Agregar metales
        metal = Metal.new('Metal', value)
        #Calcular valor
        calculator.translate_intergallactic_units(intergallactic_units)
        #Calcular valor de metal
        calculator.translate_intergallactic_units(intergallactic_units) * metal.value
    end

end
