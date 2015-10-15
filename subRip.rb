require 'pry'

class ReadFile

	def initialize
		@lines = []
		@times = []
	end

	def actions
		readFile
		search_time(@lines)
		splitTime
		puts @lines
	end

	def readFile
		file=File.open("./GameOfThrones.srt", "r")
		@lines = file.readlines
		file.close
	end

	def search_time(lines)
		lines.each_with_index do |line, index|
			scan_line(line, index)
		end
	end

	def scan_line(line, index)
		if line.include?("-->")
			time_position(index)
		end

	end

	def time_position(pos)
		@times << pos
	end

	def splitTime
		@times.each do |index|
			@lines[index] = @lines[index].split(" ")
		end
	end

end

class AddingTimes
end

class WriteFile
end

read = ReadFile.new.actions