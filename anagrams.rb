def first_method(str1, str2)
  anagrams(str1).each do |a1|
    anagrams(str2).each do |a2|
      return true if a1 == a2
    end
  end
  false
end

def anagrams(str)
  result_arr = []
  str_arr = str.split("")
  str_arr.each_with_index do |pivot, idx|
    left = str_arr[0...idx]
    right = str_arr[idx + 1..-1]
    result_arr += possible(left, right, pivot)
  end
  result_arr
end

def possible(left, right, pivot)
  final = []
  left_times = left.length == 0 ? 0 : left.length
  (left_times).times do
    left.push(left.shift)
    final << left + [pivot] + right
  end
  right_times = right.length == 0 ? 0 : right.length
  (right_times).times do
    right.push(right.shift)
    final << left + [pivot] + right
  end
  final
end




def second_anagram(str1, str2)
  arr1 = str1.split('')
  arr2 = str2.split('')
  arr1_copy = arr1.dup
  length = arr1.length
  arr1_copy.each do |ch|
    return false unless arr2.include?(ch)
    arr1.delete_at(arr1.find_index(ch))
    arr2.delete_at(arr2.find_index(ch))
  end
  arr1.empty? && arr2.empty?
end

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2)
  arr1 = str1.split('')
  arr2 = str2.split('')
  hash1 = create_freq_hash(arr1)
  hash2 = create_freq_hash(arr2)

  hash1 == hash2

end

def create_freq_hash(arr)
  temp_hash = Hash.new(0)
  arr.uniq.each do |el|
    temp_hash[el] = arr.count(el)
  end
  temp_hash
end

def fourth_anagram_bonus?(str1, str2)
  arr1 = str1.split('')
  arr2 = str2.split('')
  hash = create_freq_hash_bonus(arr1, arr2)

  hash.values.all? { |v| v == 0 }

end

def create_freq_hash_bonus(arr1, arr2)
  temp_hash = Hash.new(0)
  arr1.uniq.each do |el|
    temp_hash[el] = arr1.count(el)
  end
  arr2.uniq.each do |el|
    temp_hash[el] -= arr2.count(el)
  end
  temp_hash
end
