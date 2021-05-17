class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    num < @max && num >= 0 ? @store[num] = true : (raise 'Out of bounds')
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % @store.length 
    @store[i] << num
  end

  def remove(num)
    @store[num % @store.length].delete(num)
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      @store[num % num_buckets] << num 
      @count += 1
      resize! if num_buckets < count
    end
  end

  def remove(num)
    if include?(num)
      @store[num % @store.length].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = @store.dup
    @store = Array.new(num_buckets*2) { Array.new }
    arr.each do |sub_array|
      sub_array.each do |ele|
        help_insert(ele)
      end
    end
    # resize! if num_buckets < count
  end

  def help_insert(num)
    if !self.include?(num)
      @store[num % num_buckets] << num 
      resize! if num_buckets < count
    end
  end
end
