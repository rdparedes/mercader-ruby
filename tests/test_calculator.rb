require './lib/calculator.rb'
require 'test/unit'


class TestCalculator < Test::Unit::TestCase

    def setup
        @roman_to_intergalactic_units_mapping = {
            "I" => nil,
            "V" => nil,
            "X" => nil,
            "L" => nil,
            "C" => nil,
            "D" => nil,
            "M" => nil
        }
        @calculator = Calculator.new(@roman_to_intergalactic_units_mapping)
    end

    def test_adds_intergalactic_units
        expected_roman_to_intergalactic_units_mapping = {
            "I" => "one",
            "V" => "five"
        }
        calculator = Calculator.new({
            "I" => nil,
            "V" => nil
        })

        calculator.add_intergalactic_unit("I", "one")
        calculator.add_intergalactic_unit("V", "five")

        assert_equal(expected_roman_to_intergalactic_units_mapping, calculator.roman_to_intergalactic_units_mapping)
    end

    def test_converts_roman_numbers_to_quantity
        assert_equal(1944, @calculator.convert_romans_to_quantity("MCMXLIV"))
        assert_equal(159, @calculator.convert_romans_to_quantity("CLIX"))
    end

    def test_returns_minus_1_when_roman_numbers_are_badly_formatted
        assert_equal(-1, @calculator.convert_romans_to_quantity("MADF"))
        assert_equal(-1, @calculator.convert_romans_to_quantity("IMXC"))
    end

    def test_translates_intergalactic_units_to_quantity
        @calculator.add_intergalactic_unit("I", "one")
        @calculator.add_intergalactic_unit("V", "five")
        @calculator.add_intergalactic_unit("X", "ten")
        @calculator.add_intergalactic_unit("L", "fifty")

        assert_equal(10, @calculator.translate_intergalactic_units("ten"))
        assert_equal(74, @calculator.translate_intergalactic_units("fifty ten ten one five"))
    end

    def test_initializes_with_empty_dictionary_if_no_params_or_nil
        calculator = Calculator.new()
        assert_equal(
            @roman_to_intergalactic_units_mapping, 
            calculator.roman_to_intergalactic_units_mapping
        )
        calculator = Calculator.new(nil)
        assert_equal(
            @roman_to_intergalactic_units_mapping, 
            calculator.roman_to_intergalactic_units_mapping
        )
    end

    def test_should_not_create_intergalactic_units_if_not_equivalent_to_valid_roman_units
        calculator = Calculator.new()
        calculator.add_intergalactic_unit("F", "one")
        
        actual_roman_to_intergalactic_units_mapping = calculator.roman_to_intergalactic_units_mapping
        
        assert_equal(@roman_to_intergalactic_units_mapping, actual_roman_to_intergalactic_units_mapping)
    end

end