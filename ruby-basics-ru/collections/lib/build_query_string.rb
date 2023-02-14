# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
    queryString = ''
    params.sort.each_with_index do |(key, value), index|
      queryString += '&' if index > 0
      queryString += "#{key}=#{value}"
    end
    queryString
end
# END
# rubocop:enable Style/For
