# require "byebug"

def no_dupes?(arr)
	arr.select { |ele| arr.count(ele) == 1 }
end

def no_consecutive_repeats?(arr)
	arr.each_with_index do |ele, idx|
		return false if ele == arr[idx+1]
	end
	true
end

def char_indices(str)
	hash = Hash.new
	str.each_char.with_index do |char, idx|
		idx_arr = []
		hash[char] = idx_arr if hash[char].nil?
		hash[char] << idx
	end
	hash
end

def longest_streak(str)
	hash = Hash.new("")
	str.reverse.each_char { |char| hash[char] += char }
	key_val_pair = hash.max_by { |key, val| val.length }
	key_val_pair[-1]
end

# Helper method for bi_prime?
def prime?(num)
	return false if num < 2
	(2...num).none? { |divisor| num % divisor == 0 }
end

def bi_prime?(num)
	prime_nums = []
	(0...num).each { |n| prime_nums << n if prime?(n) }
	prime_nums.each_with_index do |num_1, idx_1|
		prime_nums.each_with_index do |num_2, idx_2|
			return true	if idx_2 >= idx_1 && num_1 * num_2 == num
		end
	end
	false
end

def vigenere_cipher(message, keys)
	alphabets = ("a".."z").to_a
	encrypted_msg = ""
	if keys.length == 1
		message.each_char do |char|
			new_idx = (alphabets.find_index(char) + keys[0]) % 26
			encrypted_msg += alphabets[new_idx]
		end
	else
		message.each_char.with_index do |char, idx|
			new_idx = (alphabets.find_index(char) + keys[(idx + 1) % keys.length - 1]) % 26
			encrypted_msg += alphabets[new_idx]
		end
	end
	encrypted_msg
end

# Helpful method for vowel_rotate
def vowel?(char)
	"aeiouAEIOU".include?(char)
end

def vowel_rotate(str)
	vowels = []
	str.each_char.with_index do |char, idx|
		if vowel?(char)
			vowels << char
			str[idx] = "-"
		end
	end
	vowels.rotate!(-1)
	# p vowel_order
	# p str
	
	new_str = ""
	str.each_char do |char|
		if char == "-"
			new_str += vowels[0]
			vowels.slice!(0)
		else
			new_str += char
		end
	end

	new_str
end


# Proc Problems
class String
	def select(&prc)
		
	end

	def map!(&prc)
		
	end
end

# Recursion Problems
def multiply(a, b)
	
end

def lucas_sequence(length)
	
end

def prime_factorization(num)
	
end