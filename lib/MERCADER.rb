require_relative('io_handler')
require_relative('calculator')


class Mercader
    
    attr_reader :metals, :output

    @@REGEX = {
        'add_intergalactic_unit' => /^\b(?!is\b)\w+ is ([IVXLCDM])$/,
        'create_metal' => /^(\b(?!is\b)[a-z]+\s?)+ [A-Z][a-z]* is (\d)+ Credits$/,
        'calculate_value' => /^how much is (\b(?!is\b)[a-z]+\s?)+ \?$/,
        'calculate_metal_price' => /^how many Credits is (\b(?!is\b)[a-z]+\s?)+ [A-Z][a-z]* \?$/
    }

    def initialize(calculator=nil)
        @calculator = calculator ? calculator : Calculator.new()
        @metals = {}
        @output = []
    end

    def calculate(input_file_path, output_file_path)
        begin
            input_text = IOHandler.read_file(input_file_path)
            input_lines = IOHandler.get_lines_from_string(input_text)

            input_lines.each do |input_line|

                if input_line.match(@@REGEX['add_intergalactic_unit'])
                    add_intergalactic_unit(input_line)

                elsif input_line.match(@@REGEX['create_metal'])
                    create_metal(input_line)

                elsif input_line.match(@@REGEX['calculate_value'])
                    calculate_value(input_line)

                elsif input_line.match(@@REGEX['calculate_metal_price'])
                    calculate_metal_price(input_line)
                
                else
                    @output.push("I have no idea what you are talking about")
                
                end
            end

        rescue IOError => e
            puts e.message
            raise

        rescue Exception => e
            puts e.message
            raise
        end

        IOHandler.write_file(output_file_path, @output.join("\n"))
    end

    def add_intergalactic_unit(input_line)
        roman_value = input_line.split(" ")[-1]
        name = input_line.split(" ")[0]
        @calculator.add_intergalactic_unit(roman_value, name)
    end

    def create_metal(input_line)
        intergalactic_units = input_line.split(" ")[0..-5].join(" ")
        name = input_line.split(" ")[-4]
        value = Integer(input_line.split(" ")[-2]).to_f / 
            @calculator.translate_intergalactic_units(intergalactic_units)

        @metals[name] = value
    end

    def calculate_value(input_line)
        begin
            intergalactic_units = input_line.split(" ")[3..-2].join(" ")
            result = @calculator.translate_intergalactic_units(intergalactic_units)

            output_line = intergalactic_units + " is " + trim(result).to_s

            @output.push(output_line)

        rescue Exception => e
            @output.push("I have no idea what you are talking about")
        end
    end

    def calculate_metal_price(input_line)
        begin
            intergalactic_units = input_line.split(" ")[4..-3].join(" ")
            metal_name = input_line.split(" ")[-2]

            result = @calculator.translate_intergalactic_units(intergalactic_units) * 
                @metals[metal_name]

            output_line = intergalactic_units + " " + metal_name + " is " + trim(result).to_s + " Credits"

            @output.push(output_line)

        rescue Exception => e
            @output.push("I have no idea what you are talking about")
        end
    end

    def trim(number)
        i, f = number.to_i, number.to_f
        i == f ? i : f
    end

    private :trim

end
