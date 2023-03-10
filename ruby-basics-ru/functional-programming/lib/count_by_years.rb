# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  men = users.filter { |u| u[:gender] == 'male' }
  years = men.map { |u| u[:birthday][0, 4] }
  
  years.reduce({}) do |acc, year|
    acc[year] ||= 0
    acc[year] += 1
    acc
  end
end
# END
