require './lib/mercader.rb'
require './lib/calculator.rb'
require './lib/io_handler.rb'
require 'test/unit'
require 'mocha/test_unit'


class TestMercader < Test::Unit::TestCase

    def test_should_calculate_input_data
        input_file_path = "./data/test-input.txt"
        output_file_path = ".data/test-output.txt"

        expected_output = ["pish tegj glob glob is 42",
                        "glob prok Silver is 68 Credits",
                        "glob prok Gold is 57800 Credits",
                        "glob prok Iron is 782 Credits",
                        "I have no idea what you are talking about"].join("\n")

        mercader_app = Mercader.new(Calculator.new())
        mercader_app.calculate(input_file_path, output_file_path)

        actual_output = IOHandler.read_file(output_file_path)

        assert_equal(expected_output, actual_output) 
    end

    def test_read_line_and_add_intergalactic_unit
        calculator = mock()
        mercader_app = Mercader.new(calculator)

        calculator.expects(:add_intergalactic_unit).with("X", "pish")

        mercader_app.add_intergalactic_unit("pish is X")
    end

    def test_read_line_and_create_metal
        calculator = mock()
        mercader_app = Mercader.new(calculator)

        calculator.expects(:translate_intergalactic_units).with("glob prok").returns(4)

        mercader_app.create_metal("glob prok Gold is 57800 Credits")

        assert_equal(14450, mercader_app.metals['Gold'])
    end

    def test_read_line_and_calculate_value
        mercader_app = Mercader.new(Calculator.new())

        mercader_app.add_intergalactic_unit("glob is I")
        mercader_app.add_intergalactic_unit("pish is X")
        mercader_app.add_intergalactic_unit("tegj is L")
        mercader_app.calculate_value("how much is pish tegj glob glob ?")
        mercader_app.calculate_value("how much is glob pish ?")

        expected_output = ["pish tegj glob glob is 42", "glob pish is 9"]

        assert_equal(expected_output, mercader_app.output)
    end

    def test_read_line_and_calculate_metal_price
        mercader_app = Mercader.new(Calculator.new())

        mercader_app.add_intergalactic_unit("glob is I")
        mercader_app.add_intergalactic_unit("prok is V")
        mercader_app.add_intergalactic_unit("pish is X")
        mercader_app.create_metal("glob glob Silver is 34 Credits")
        mercader_app.create_metal("pish pish Iron is 3910 Credits")
        mercader_app.calculate_metal_price("how many Credits is glob prok Silver ?")
        mercader_app.calculate_metal_price("how many Credits is glob prok Iron ?")

        expected_output = ["glob prok Silver is 68 Credits", "glob prok Iron is 782 Credits"]

        assert_equal(expected_output, mercader_app.output)
    end

end