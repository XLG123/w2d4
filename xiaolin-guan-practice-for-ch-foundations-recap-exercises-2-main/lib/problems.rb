# Write a method, least_common_multiple, that takes in two numbers and returns
# the smallest number that is a mutiple of both of the given numbers
def least_common_multiple(num_1, num_2)
	if num_1 % num_2 == 0
		return num_1
	elsif num_2 % num_1 == 0
		return num_2
	end
	product = num_1 * num_2
	maximum = [num_1, num_2].max
	
	(maximum..product).each do |number|
		return number if number % num_1 == 0 && number % num_2 == 0
	end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the
# two adjacent letters that appear the most in the string.
def most_frequent_bigram(str)
	last_idx = str.length - 1
	adjacent_pairs = str.each_char.map.with_index do |char, idx|
		char + str[idx+1] if idx != last_idx
	end
	adjacent_pairs.max_by { |pair| adjacent_pairs.count(pair) }
end


class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value
  # pairs are swapped
	def inverse
		inverted_hash = {}
		self.each { |key, val| inverted_hash[val] = key }
		inverted_hash
	end
end


class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns
  # the number of pairs of elements that sum to the given target
	def pair_sum_count(num)
		count = 0
		self.each_with_index do |num_1, idx_1|
			self.each_with_index do |num_2, idx_2|
				count += 1 if idx_2 > idx_1 && num_1 + num_2 == num
			end
		end
		count
	end


  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  #
  # Sorting algorithms like bubble_sort commonly accept a block. That block
  # accepts two parameters, which represents the two elements in the array being
  # compared. If the block returns 1, it means that the second element passed to
  # the block should go before the first (i.e., switch the elements). If the
  # block returns -1, it means the first element passed to the block should go
  # before the second (i.e., do not switch them). If the block returns 0 it
  # implies that it does not matter which element goes first (i.e., do nothing).
  #
  # This should remind you of the spaceship operator! Convenient :)
	def bubble_sort(&prc)
		sorted = false
		while !sorted
			sorted = true
			(0...self.length - 1).each do |idx|
				prc ||= Proc.new { |num, next_num| num <=> next_num }
				if prc.call(self[idx], self[idx+1]) == 1
					self[idx], self[idx+1] = self[idx+1], self[idx]
					sorted = false
				end
			end
		end
		self
	end
end