# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
    @stack.push!('ruby')
    @stack.push!('php')
  end

  def test_stack_pop
    assert(@stack.pop! == 'php')
  end

  def test_stack_push
    element = 'java'
    expected = ['ruby', 'php', 'java']
    assert(@stack.push!(element) == expected)
  end

  def test_stack_empty
    refute @stack.empty?
  end

  def test_stack_to_a
    expected = ['ruby', 'php']
    assert(@stack.to_a == expected)
  end

  def test_stack_clear
    assert(@stack.clear! == [])
  end

  def test_stack_size
    assert(@stack.size == 2)
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
