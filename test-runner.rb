#!/usr/bin/ruby
Dir.glob("flatTest/*.in") do |file|
  base = file.sub(/flatTest\//, '').sub(/\.in/, '')
  system("java -jar sql-parser.jar < #{file} > bin/#{base}.out")
  diff = "diff flatTest/#{base}.exp bin/#{base}.out";
  puts diff;
  system(diff)
end
                     
