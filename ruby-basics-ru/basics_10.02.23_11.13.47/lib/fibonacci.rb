# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return nil if num < 0
  return 0 if num == 0
  a, b = 0, 1
  arr = []
        
  (0..num).each do
    arr << a
    a, b = b, a+b
  end
  arr[num]
end
# END
