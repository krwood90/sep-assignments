class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @rear = @queue[0]
    @head = @queue[@queue.length - 1]
  end

  def enqueue(element)
    @queue.unshift(element)
    return @queue
  end

  def dequeue
    @queue.delete_at(@queue.length - 1)
    return @queue
  end

  def empty?
    if queue.length <= 0
      return true
    else
      return false
    end
  end
end