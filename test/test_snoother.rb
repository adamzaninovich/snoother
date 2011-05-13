require_relative 'test_helper'

# High-level Integration tests go here

class TestSnoother < MiniTest::Unit::TestCase
  
  # def setup
  #   # This gets run before every test
  # end
  
  def test_the_truth
    assert true
  end
  
  def test_the_untruth
    refute false
  end
  
end