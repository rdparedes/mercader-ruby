require_relative("io_handler")

class Mercader

    def initialize(input_file_path, output_file_path)
        @input_file_path = input_file_path
        @output_file_path = output_file_path
    end

    attr_reader :input_file_path,:output_file_path

    def return_val(value)
        return value
    end

    def run()
        io_handler = IOHandler.new(@input_file_path, @output_file_path)
        input_text = io_handler.read_file()

        puts input_text
    end
end

app = Mercader.new("./data/sample-input.txt", "./data/output.txt")
app.run()