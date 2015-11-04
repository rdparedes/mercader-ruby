require "./lib/MERCADER.rb"
require "test/unit"

class TestMERCADER < Test::Unit::TestCase

    def test_sample
        mercader_app = Mercader.new()
        assert_equal('app ran successfuly', mercader_app.return_val('app ran successfuly')) 
    end

end