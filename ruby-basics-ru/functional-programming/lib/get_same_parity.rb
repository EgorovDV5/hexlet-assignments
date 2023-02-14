# frozen_string_literal: true

# BEGIN
def get_same_parity(arr)
  return [] if arr.empty? 
  res = arr[0].odd? ? arr.select { |item| item.odd? } : arr.select { |item| item.even? }
  res
end
# END
