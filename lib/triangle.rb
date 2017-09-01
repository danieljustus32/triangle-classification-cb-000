class Triangle

  attr_accessor :side_a, :side_b, :side_c

  def initialize(a, b, c)
    @side_a = a
    @side_b = b
    @side_c = c
    @sides = [a, b, c]
  end

  def kind
    kind = nil
    a = @sides[0]
    b = @sides[1]
    c = @sides[2]
    if a + b <= c || b + c <= a || a + c <= b
      raise TriangleError
    end
    eq_sides = self.sides.keep_if{|s| s == @sides[0]}
    if eq_sides.size == 3
      kind = :equilateral
    elsif eq_sides.size == 2
      kind = :isosceles
    elsif b == c
      kind = :isosceles
    elsif eq_sides.size == 1
      kind = :scalene
    end
    kind
  end

  def sides
    @sides
  end
end

class TriangleError < StandardError
end
