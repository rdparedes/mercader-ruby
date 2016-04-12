require './lib/mercader.rb'
require './lib/io_handler.rb'
require 'test/unit'


class TestMercader < Test::Unit::TestCase

    def test_should_convert_intergallactic_currency_to_roman_numbers
        input_file_path = "./data/test-input.txt"
        output_file_path = ".data/test-output.txt"

        expected_output = ["pish tegj glob glob is 42",
                        "glob prok Silver is 68 Credits",
                        "glob prok Gold is 57800 Credits",
                        "glob prok Iron is 782 Credits",
                        "I have no idea what you are talking about"].join("\n")

        mercader_app = Mercader.new()
        mercader_app.calculate(input_file_path, output_file_path)

        actual_output = IOHandler.read_file(output_file_path)

        assert_equal(expected_output, actual_output) 
    end

end