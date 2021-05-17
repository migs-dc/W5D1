class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    result = 0
    each.with_index do |num, i|
      result += num.hash + num * i
    end
    result 
  end
end

class String
  def hash
    result = 0
    each_char.with_index do |char, i|
      result += char.hash 
    end
    result 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
