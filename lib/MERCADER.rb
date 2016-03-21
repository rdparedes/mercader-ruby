require_relative('io_handler')

class Mercader

    # attr_reader :input_file_path,:output_file_path

    def calculate(input_file_path, output_file_path)
        input_text = IOHandler.read_file(input_file_path)
        input_lines = IOHandler.get_lines_from_string(input_text)
        output = []

        input_lines.each do |input_line|
            
        end

        # Interpretar inputs
            # Grabar valores equivalentes a numeros romanos
            # Calcular valores de metales
            # Leer preguntas

        # Ir guardando respuestas en el output dependiendo de la línea

        IOHandler.write_file(output_file_path, output.join("\n"))
    end
end
