require './lib/io_handler.rb'
require 'tempfile'
require 'test/unit'


class TestIOHandler < Test::Unit::TestCase

    def setup
        @test_file = Tempfile.new('test')
    end

    def teardown
        @test_file.unlink
    end

    def test_should_read_file_contents_and_return_as_string()
        expected_output = ["line1", "line2"].join("\n")

        @test_file.write(expected_output)
        @test_file.rewind

        actual_string = IOHandler.read_file(@test_file.path)

        assert_equal(expected_output, actual_string)
    end

    def test_should_write_text_to_file()
        expected_string = ["line1", "line2"].join("\n")

        IOHandler.write_file(@test_file.path, expected_string)

        actual_string = IOHandler.read_file(@test_file.path)

        assert_equal(expected_string, actual_string)
    end

    def test_should_return_multi_lines_string_as_list()
        multi_line_string = ["line1", "line2"].join("\n")
        expected_list = ["line1", "line2"]

        actual_list = IOHandler.get_lines_from_string(multi_line_string)

        assert_equal(expected_list, actual_list)
    end

end