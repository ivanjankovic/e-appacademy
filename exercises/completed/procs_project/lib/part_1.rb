# my_map
def my_map(arr, &prc)
  new_arr = []

  arr.each { |ele| new_arr << prc.call(ele) }

  new_arr
end

# my_select

def my_select(arr, &prc)
  selected = []

  arr.each { |ele| selected << ele if prc.call(ele) }

  selected
end

# my_count
def my_count(arr, &prc)
  cnt = 0

  arr.each { |el| cnt += 1 if prc.call(el) }

  cnt
end

# my_any?
def my_any?(arr, &prc)
  arr.each { |el| return true if prc.call(el) }
  false
end

# my_all?
def my_all?(arr, &prc)
  arr.each { |el| return false if prc.call(el) == false }
  true
end

# my_none?
def my_none?(arr, &prc)
  arr.each { |el| return false if prc.call(el) }
  true
end
