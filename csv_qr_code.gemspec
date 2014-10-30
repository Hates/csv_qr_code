# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csv_qr_code/version'

Gem::Specification.new do |spec|
  spec.name          = "csv_qr_code"
  spec.version       = CsvQrCode::VERSION
  spec.authors       = ["Richard Hart"]
  spec.email         = ["richard@ur-ban.com"]
  spec.summary       = %q{Generate QR codes from CSV}
  spec.description   = %q{Generate QR codes from CSV}
  spec.homepage      = "https://github.com/Hates/csv_qr_code"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'rqrcode_png', "0.1.2"
end
