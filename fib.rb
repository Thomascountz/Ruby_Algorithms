def fibs(n)
  arr = Array.new()
  arr = [0] if n == 1
  arr = [0, 1] if n == 2
  if n > 2
    arr = [0, 1]
    until arr.length == n do 
      arr << arr[-1] + arr[-2]
    end
  end
  arr
end

def fibs_rec(n)
  return if n < 0
  
  if n == 1
    0
  elsif n == 2
    1
  else
    fibs_rec(n-1) + fibs_rec(n-2)
  end
 
end

# def fibs_rec(n)
#   fibs_rec(n-1) + fibs_rec(n-2) if n > 0
# end

puts fibs_rec(8)