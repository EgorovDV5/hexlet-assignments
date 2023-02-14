# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return nil if start > stop
  arr = []
  start.upto stop do |i|
    if (i % 3).zero? && (i % 5).zero? 
      then arr << 'FizzBuzz'
    elsif (i % 3).zero?
      then arr << 'Fizz'
    elsif (i % 5).zero? 
      then arr << 'Buzz'
    else arr << i.to_s
    end
  end
  arr.join(' ');
end
# END
