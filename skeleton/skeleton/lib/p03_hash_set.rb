class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      @store[key] << key 
      count += 1
    end
  end

  def include?(key)
    @store[key] == key
  end

  def remove(key)
  end

  private

  def [](num)
    @store[num % num_buckets]# optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
