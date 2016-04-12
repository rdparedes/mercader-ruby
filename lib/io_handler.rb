class IOHandler

    def self.read_file(file_path)
        begin
            input_text = ""
            File.open(file_path, "r") do |f|
                f.each_line do |line|
                    input_text << line
                end
            end
            return input_text

        rescue Exception => e
            puts e.message
            puts "There was an error while trying to read the input file."
        end
    end

    def self.write_file(file_path, input)
        begin
            File.open(file_path, "w") do |f|
                f.write(input)
            end

        rescue Exception => e
            puts e.message
            puts "There was an error while trying to save the output file."
        end
    end

    def self.get_lines_from_string(input)
        begin
            return input.split("\n")

        rescue Exception => e
            puts e.message
        end
    end

end