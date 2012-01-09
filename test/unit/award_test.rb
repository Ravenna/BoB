require 'test_helper'

class AwardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "find awards by category" do
    
    @categories = [categories(:one), categories(:two)]
    @awards = awards(:one, :two, :one_not_two) 
    assert_equal @awards, Award.in_categories(@categories).order('name ASC')
    assert_equal @awards.reverse, Award.in_categories(@categories).order('name DESC')
    
  end
end
