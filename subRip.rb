require 'pry'

class ReadFile

	def initialize
	end

	def readFile
		file=File.open("./GameOfThrones.srt", "r")
		lines = file.readlines
		#binding.pry
		file.close

		search_time(lines)
		#times = lines.strptime(format='%H%M%S,%L')
	end

	def search_time(lines)
		lines.each_with_index do |line, index|
			scan_line(line, index)
		end
	end

	def scan_line(line, index)
		if line.include?("-->")
			puts "Line with sign at index #{index}"
			#do something
		else
			puts "no"
			#do something else
		end
	end
end

class WriteFile
end

read = ReadFile.new.readFile