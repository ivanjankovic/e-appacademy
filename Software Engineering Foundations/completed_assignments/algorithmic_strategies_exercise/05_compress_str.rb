# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  chars = str.split('')
  temp = chars[0]
  compressed = []

  (1...chars.length).each do |i|
    
    if chars[i] == chars[i - 1]
      temp += chars[i]
    else
      compressed << temp
      temp = chars[i]
    end
    
    if i === chars.length - 1
      compressed << temp
    end

  end

  compressed.map! do |ele|
    if ele.length == 1
      ele
    else
      ele.length.to_s + ele[0]
    end 
  end

  compressed.join
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
