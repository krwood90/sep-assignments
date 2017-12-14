class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size())
    if @items[i] == nil
      @items[i] = HashItem.new(key, value)
    elsif @items[i].key == key && @items[i].value == value
      return "duplicate"
    else
      loop do
        resize()
        j = index(key, size())
        break if @items[j] == nil || @items[j].key == key
      end
      j = index(key, size())
      if @items[j] == nil
        @items[j] = HashItem.new(key, value)
      else
        @items[j].value = value
      end
    end
  end


  def [](key)
    i = index(key, size())

    if @items[i]
      return @items[i].value
    end
  end

  def resize
    transArr = Array.new(@items.length * 2)
    (0..@items.length).each do |el|
      if items[el]
        newIndex = @items[el].key.sum % transArr.length
        transArr[newIndex] = @items[el]
        @items[el] = nil
      end
    end
    @items = transArr
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte do |c|
      sum += c
    end
    sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end