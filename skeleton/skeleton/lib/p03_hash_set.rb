class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      @store[count % num_buckets] << key 
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def include?(key)
    @store.any? { |ele| ele.include?(key) }
  end

  def remove(key)
    if include?(key)
      @count -= 1
      @store.each { |ele| ele.delete(key) }
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
    @store = Array.new(num_buckets*2) { Array.new }
    arr.each { |ele| ele.each { |ele_2| help_insert(ele_2) } }
  end

  def help_insert(key)
    if !include?(key)
      @store[count % num_buckets] << key 
      resize! if @count > num_buckets
    end
  end

end
