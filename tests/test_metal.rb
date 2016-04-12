require './lib/metal.rb'
require 'test/unit'


class TestMetal < Test::Unit::TestCase

    def test_should_not_create_metal_if_first_letter_is_lowercase()
        assert_raise do
            test_metal = Metal.new('lowercase_name', 1)
        end
    end

    def test_should_set_unit_price_of_metal()
        metal = Metal.new('Test_metal', 1500)
        assert_equal(1500, metal.value)
    end

end