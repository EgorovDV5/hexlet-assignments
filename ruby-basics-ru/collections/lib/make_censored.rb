# frozen_string_literal: true

# rubocop:disable Style/For

def make_censored(text, stop_words)
  # BEGIN
    words = text.split
    res = []
    words.each do |word|
      if stop_words.include? word
        then res << "$#%!"
      else
        res << word
      end
    end
    res.join(' ')
  # END
end

# rubocop:enable Style/For
