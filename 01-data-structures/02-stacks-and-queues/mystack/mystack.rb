class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    @index = 0
    self.top = nil
  end

  def push(item)
    @stack[@index] = item
    @index += 1
    return @stack
  end

  def pop
    @index -= 1
    @stack.delete_at(@index)
    return @stack
  end

  def empty?
    if(@stack.length <= 0)
      return true
    else
      return false
    end
  end
end