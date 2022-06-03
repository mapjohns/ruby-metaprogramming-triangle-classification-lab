require 'pry'
class Triangle
  # write code here
  attr_accessor :l1, :l2, :l3
  def initialize(l1, l2, l3)
    @l1 = l1.to_f
    @l2 = l2.to_f
    @l3 = l3.to_f
    t_array
  end

  def t_array
    tri = []
    tri << self.l1
    tri << self.l2
    tri << self.l3
  end

  def check_sum
    bool = []
    bool << test1 = @l1 + @l2 > @l3
    bool << test2 = @l1 + @l3 > @l2
    bool << test3 = @l2 + @l3 > @l1
    bool.include?(false)
  end

  def non_eq
    isoc = []
    isoc << test1 = @l1 == @l2
    isoc << test2 = @l1 == @l3
    isoc << test3 = @l2 == @l3
    tf_counts = []
    false_count = isoc.select {|bool| bool == false}
    true_count = isoc.select {|bool| bool == true}
    tf_counts << false_count.size
    tf_counts << true_count.size
    tf_counts
  end

  def kind
    if t_array.include?(0) == true || check_sum == true
      raise TriangleError
    else
      if (@l1 + @l2 + @l3)/3 == @l1
        :equilateral
      elsif non_eq[0] == 2
        :isosceles
      elsif  non_eq[0] == 3
        :scalene
      end
    end
  end

  class TriangleError < StandardError
    # triangle error code

  end
end
