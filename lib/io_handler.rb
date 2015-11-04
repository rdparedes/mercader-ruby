class IOHandler

    def initialize(input_file_path, output_file_path)
        @input_file_path = input_file_path
        @output_file_path = output_file_path
    end

    attr_accessor :input_file_path,:output_file_path

    def read_file()
        begin
            input_text = ""
            File.open(@input_file_path, 'r') do |f|
                f.each_line do |line|
                    input_text << line
                end
            end 

            return input_text
        rescue Exception => e
            puts e.message
            puts "Error reading the input file."
        end
    end

end