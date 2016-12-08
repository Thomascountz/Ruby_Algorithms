def merge_sort(arr)
  
  a = arr
  b = a[0..(arr.length/2)-1].dup
  c = a[(arr.length/2)..-1].dup
  

  if b.length > 1 
    b = merge_sort(b)
  end
  
  if c.length > 1
    c = merge_sort(c)
  end
  
  a_index = 0
  b_index = 0
  c_index = 0
  
  
  while b_index < b.length && c_index < c.length do
    if b[b_index] <= c[c_index]
      a[a_index] = b[b_index]
      b_index += 1
    else 
      a[a_index] = c[c_index]
      c_index += 1
    end
    a_index += 1
  end
  
  while b_index == b.length && a_index < a.length do
    a[a_index] = c[c_index]
    a_index += 1
    c_index += 1
  end
  
  while c_index == c.length && a_index < a.length do
    a[a_index] = b[b_index]
    a_index += 1
    b_index += 1
  end
  
  return a
end