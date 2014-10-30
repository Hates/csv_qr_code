require 'rqrcode_png'
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
        puts "Generating QR code for: #{row[0]}"
        qr = RQRCode::QRCode.new row[0], size: 8, level: :h
        qr.to_img.resize(@width, @height).save(File.join(@output_dir, "#{row[1]}.png"))
      end
    end

    private

    def empty_row?(row)
      row[0].nil? || row[1].nil? || row[0].empty? || row[1].empty?
    end

  end
end