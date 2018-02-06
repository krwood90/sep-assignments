require 'benchmark'

def heap_sort(arr)
	# heapify
	(1..arr.length - 1).each do |i|
		# move up element to establish max heap
		child = i
		while child > 0
			parent = (child - 1) / 2
			if arr[parent] < arr[child]
                temp = arr[parent]
				arr[parent] = arr[child]
                arr[child] = temp
				child = parent
			else
				break
			end
		end
	end

	# sort
	i = arr.length - 1
    # swap max heap value (root) to the end of the array
	while i > 0
        temp = arr[0]
		arr[0] = arr[i]
        arr[i] = temp
    # prepare next sorted location
		i -= 1

		# move down swapped element to maintain max heap
		parent = 0
		while parent * 2 + 1 <= i
      # left child
			child = parent * 2 + 1
      # if left child is ____ and left child is less than right child, use right child
			if child < i && arr[child] < arr[child + 1]
				child += 1
			end
      # if parent element is less than child element, swap the two
			if arr[parent] < arr[child]
                temp = arr[child]
                arr[child] = arr[parent]
				arr[parent] = temp
				parent = child
			else
				break
			end
		end
	end

	arr
end

arr = [0,11,21,32,42,58,6,7,81,9,10,11,124,131,146,15,16,137,187,19,220,21,30,315,412,77,144]
puts "#{heap_sort(arr)}"