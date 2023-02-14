# frozen_string_literal: true

# BEGIN
def anagramm_filter(text, arr)
  res = []
  arr.each do |word|
    res << word if text.chars.sort == word.chars.sort
  end
  res
end
# END
