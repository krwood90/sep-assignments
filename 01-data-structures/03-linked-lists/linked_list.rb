require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    temp_node = @head

    if temp_node == @tail
      @head = nil
      @tail = nil
    else 
      while temp_node.next != @tail
        temp_node = temp_node.next
      end

      @tail = temp_node
    end
  end

  # This method prints out a representation of the list.
  def print
    temp_node = @head

    while temp_node != @tail
      if temp_node.next == @tail
        puts temp_node.data
        puts temp_node.next.data
        break
      else
        puts temp_node.data
        temp_node = temp_node.next
      end
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp_node = @head

    while temp_node != @tail
      if @head == node
        if @head = @tail
          @head = nil
          break
        else
          @head = @head.next
          break
        end
      elsif temp_node.next == node
        if temp_node.next == @tail
          @tail = temp_node
          break
        else
          temp_node.next = temp_node.next.next
          break
        end
      end

      temp_node = temp_node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp_node = @head
    @head = node
    @head.next = temp_node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if !@head.nil?
      if @head == @tail
        temp_node = @head
        @head = nil
        @tail = nil

        return temp_node
      else
        temp_node = @head
        @head = @head.next
        return temp_node
      end
    else
      nil
    end
  end
end