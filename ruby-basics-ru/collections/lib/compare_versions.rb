# frozen_string_literal: true

# BEGIN
def compare_versions(v1, v2)
  major1 = v1.split('.').first.to_i
  minor1 = v1.split('.').last.to_i
    
  major2 = v2.split('.').first.to_i
  minor2 = v2.split('.').last.to_i
  
  case major1 <=> major2
    when -1 then return -1
    when 1  then return 1
    when 0  then 
      case minor1 <=> minor2
        when -1 then return -1
        when 0 then return 0
        when 1 then return 1
      end
  end
end
# END
