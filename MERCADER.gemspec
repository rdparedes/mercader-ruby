#coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name          = "MERCADER"
    spec.version       = '1.0'
    spec.authors       = ["Roberto Paredes"]
    spec.email         = ["rdparedessalazar@gmail.com"]
    spec.summary       = %q{Thoughtworks' merchant guide to Galaxy exercise}
    spec.description   = %q{After 5 months working in TW, this is my second solution to the same problem I solved when I entered the company.}
    spec.license       = "MIT"

    spec.files         = ['lib/MERCADER.rb']
    spec.executables   = ['bin/MERCADER']
    spec.test_files    = ['tests/test_MERCADER.rb']
    spec.require_paths = ["lib"]
end