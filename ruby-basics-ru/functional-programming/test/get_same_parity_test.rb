# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/get_same_parity'

class GetSameParityTest < Minitest::Test
  def test_get_same_parity
    assert { get_same_parity([]) == [] }
    assert { get_same_parity([1, 1, 1, 1]) == [1, 1, 1, 1] }
    assert { get_same_parity([1, 2, 3]) == [1, 3] }
    assert { get_same_parity([2, 10, 15, 20]) == [2, 10, 20] }
    assert { get_same_parity([12_345, 32_154, 112_332]) == [12_345] }
  end
end
