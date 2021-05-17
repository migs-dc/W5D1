class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      self[key.hash] << key 
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if include?(key)
      @count -= 1
      self[key.hash].delete(key)
    end
  end

  private

  def [](num)
    @store[num % num_buckets]# optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = @store.dup
    @count = 0
    @store = Array.new(num_buckets*2) { Array.new }
    arr.each { |ele| ele.each { |ele_2| insert(ele_2) } }
  end

end
