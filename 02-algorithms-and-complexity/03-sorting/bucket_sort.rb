require 'benchmark'

def bucketSort(array)
    if array.length <= 1
        return array
    else
        mid = (array.length / 2).floor
        top = array[(mid + 1)..(array.length)]
        bottom = array[0..mid]
        sorted_b = quickSort(bottom)
        sorted_t = quickSort(top)
        return q_sort(sorted_b + sorted_t)
    end
end

def bucketSortTwo(array)
    if array.length <= 1
        return array
    else
        up_to_fifty = []
        over_fifty = []
        over_one_hundred = []
        array.each do |x|
          if x <= 50
            up_to_fifty.push(x)
          elsif x > 50 && x <= 100
            over_fifty.push(x)
          else
            over_one_hundred.push(x)
          end
        end
        return q_sort(up_to_fifty) + q_sort(over_fifty) +q_sort(over_one_hundred)
    end
end

def quickSort(array)
    if array.length <= 1
        return array
    else
        pivot = array.last
        less = []
        more = []
        array.pop
        array.each do |x|
            x <= pivot ? less.push(x) : more.push(x)
        end
        return quickSort(less) + [pivot] + quickSort(more)
    end
end

search_array2 = [0,11,21,32,42,58,6,7,81,9,10,11,124,131,146,15,16,137,187,19,220,21,30,315,412,77,144]

sorted_array = quickSort(search_array2)
puts sorted_array