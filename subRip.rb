require 'pry'

class ReadFile
	attr_reader :times, :lines

	def initialize
		@lines = []
		@times = []
	end

	def actions
		readFile
		search_time(@lines)
		splitTime
		return [@lines, @times]
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
	
	def initialize(seconds)
		@seconds = seconds
	end

	def actions
	#some stuff adding seconds
	end

end

class WriteFile
	
	def initialize(lines)
		@lines = lines[0]
		@times = lines[1]
		actions
	end

	def actions
	
		#actions to join the arrays
		#actions to write the new file
		@lines << "\n \nSubs times changed by Alejandro"
		join_times
		join_lines
		puts @lines

	end

	def join_times
		@times.each do |pos|
			@lines[pos]<<"\n"
			@lines[pos] = @lines[pos].join(" ")
		end
	end

	def join_lines
		@lines = @lines.join
	end

end

read = ReadFile.new.actions
write = WriteFile.new(read)