# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_stack_clean
    expectite = []
    stack = Stack.new ([1,2,3])
    assert expectite == stack.clear!.to_a
  end

  def test_stack_pop
    expectite = [1,2]
    stack = Stack.new ([1,2,3])
    stack.pop!
    assert expectite == stack.to_a
  end

  def test_stack_push
    expectite = [1,2,3]
    stack = Stack.new ([1,2])
    assert = expectite == stack.push!(3).to_a
  end

  def test_stack_empty
    stack = Stack.new ([1])
    refute stack.empty?
    stack.clear!
    assert stack.empty?
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
