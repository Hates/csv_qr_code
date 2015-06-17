require 'rqrcode'
require 'rqrcode/export/png'
require 'csv'

module CsvQrCode
  class Base

    def self.generate(csv_file, output_dir)
      new(csv_file, output_dir).generate
    end

    def initialize(csv_file, output_dir, width: 1000, height: 1000)
      @csv_file = csv_file
      @output_dir = output_dir
      @width = width
      @height = height
    end

    def generate
      CSV.foreach(@csv_file) do |row|
        next if empty_row?(row)
        size = 2
        puts "Generating QR code with size #{size} for: '#{row[0].to_s.strip}'"
        begin
          RQRCode::QRCode.new(row[0].to_s.strip, size: size, level: :l).as_png(resize_exactly_to: 600, border_modules: 0, file: File.join(@output_dir, "#{row[1]}.png"))
        rescue => e
          size += 1
          if size <= 8
            puts "Retrying QR code with size #{size} for: '#{row[0]}'"
            retry
          else
            raise e
          end
        end
        puts "----"
      end
    end

    private

    def empty_row?(row)
      row[0].nil? || row[1].nil? || row[0].empty? || row[1].empty?
    end

  end
end
