# Write a method, all_vowel_pairs, that takes in an array of words and returns
# all pairs of words that contain every vowel. Vowels are the letters a, e, i,
# o, u. A pair should have its two words in the same order as the original
# array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]
def all_vowels_included?(word_1, word_2)
	vowels = {"a"=>1, "e"=>1, "i"=>1, "o"=>1, "u"=>1}
	word_1.each_char { |char| vowels[char] -= 1 if vowels.has_key?(char) }
	word_2.each_char { |char| vowels[char] -= 1 if vowels.has_key?(char) && vowels[char] != 0 }
	vowels.values.sum == 0
end

def all_vowel_pairs(words)
	pairs = []
	words.each_with_index do |word_1, idx_1|
		words.each_with_index do |word_2, idx_2|
			if idx_2 > idx_1 && all_vowels_included?(word_1, word_2)
				pairs << "#{word_1} #{word_2}"
			end
		end
	end
	pairs

	# pairs = []
	# vowels = ["a", "e", "i", "o", "u"]
	# words.each_with_index do |word_1, idx_1|
		# words.each_with_index do |word_2, idx_2|
			# pair = "#{word_1} #{word_2}"
			# pairs << pair if vowels.all? { |vowel| pair.include?(vowel) }
		# end
	# end
	# pairs
end


# Write a method, composite?, that takes in a number and returns a boolean
# indicating if the number has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true composite?(13)    # => false
def composite?(num)
	(2...num).any? { |divisor| num % divisor == 0 }
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the order of their appearance in the
# original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
	bigrams.select { |bigram| str.include?(bigram) }
end


# Write a method, Hash#my_select, that takes in an optional proc argument
# The method should return a new hash containing the key-value pairs that return
# true when passed into the proc.
# If no proc is given, then return a new hash containing the pairs where the key
# is equal to the value.
#
# Examples:
#
# hash_1 = {x: 7, y: 1, z: 8}
# hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
#
# hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
# hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
# hash_2.my_select                            # => {4=>4}
class Hash
	def my_select(&prc)
		prc ||= Proc.new { |key, value| key == value }
		self.select { |key, value| prc.call(key, value) }
	end
end


# Write a method, String#substrings, that takes in a optional length argument
# The method should return an array of the substrings that have the given length.
# If no length is given, return all substrings.
#
# Examples:
#
# "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
# "cats".substrings(2)  # => ["ca", "at", "ts"]
class String
	def substrings(length = nil)

		sub_str = []
		(0..self.length-1).each do |idx_1|
			(idx_1..self.length-1).each do |idx_2|
				sub_str << self[idx_1..idx_2]
			end
		end

		return sub_str if length.nil?

		sub_str.select! { |str| str.length == length }
	
	end
end


# Write a method, String#caesar_cipher, that takes in an a number.
# The method should return a new string where each char of the original string
# is shifted the given number of times in the alphabet.
#
# Examples:
#
# "apple".caesar_cipher(1)    #=> "bqqmf"
# "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# "zebra".caesar_cipher(4)    #=> "difve"
class String
	def caesar_cipher(num)
		alphabets = ("a".."z").to_a
		new_str = self.each_char.map do |char|
			new_idx = (alphabets.find_index(char) + num) % 26
			alphabets[new_idx]
		end
		new_str.join("")
	end
end