require 'benchmark'

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