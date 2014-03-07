require 'pry'

class Fraction
  # We need these to be attr_reader so that we can access the values from other fractions that we may use
  attr_reader :numerator, :denominator
  def initialize(numerator, denominator)
    @numerator = numerator
    @denominator = denominator
  end

  # We implement our own custom inspect method so that the return values look like 1/2 as opposed to #<Fraction:0x007f828aa62c78 @numerator=1, @denominator=2>
  def inspect
    "#{@numerator}/#{@denominator}"
  end

  # A ruby implimentation of the Greatest Common Divisor
  def gcd(numerator, denominator)
    while numerator % denominator != 0 do
      old_numerator = numerator
      old_denominator = denominator

      numerator = old_denominator
      denominator = old_numerator % old_denominator
    end
    return denominator
  end

  def +(other_fraction)
    # The formula for addition is a/b + c/d = (a*d + b*c) / b*d
    new_numerator = @numerator * other_fraction.denominator + @denominator * other_fraction.numerator
    new_denominator = @denominator * other_fraction.denominator
    common = gcd(new_numerator, new_denominator)
    Fraction.new(new_numerator / common, new_denominator / common)
  end

  def *(other_fraction)
    new_numerator = @numerator * other_fraction.numerator
    new_denominator= @denominator * other_fraction.denominator
    common = gcd(new_numerator, new_denominator)
    Fraction.new(new_numerator / common, new_denominator / common)
  end

  def -(other_fraction)
    new_numerator = (@numerator * other_fraction.denominator) - (@denominator * other_fraction.numerator)
    new_denominator = @denominator * other_fraction.denominator
    common = gcd(new_numerator, new_denominator)
    Fraction.new(new_numerator / common, new_denominator / common)
  end

  def /(other_fraction)
    new_numerator = @numerator * other_fraction.denominator
    new_denominator = @denominator * other_fraction.numerator
    common = gcd(new_numerator, new_denominator)
    Fraction.new(new_numerator / common, new_denominator / common)
  end

  def reduce
    common = gcd(@numerator, @denominator)
    Fraction.new(@numerator / common, @denominator / common)
  end

  def ==(other_fraction)
     current = self.reduce
     other = other_fraction.reduce
     # binding.pry
    if (current.numerator == other.numerator) && (current.denominator == other.denominator)
      true
    else
      false
    end
  end

  def >(other_fraction)
    self_num = self.numerator * other_fraction.denominator
    other_num = other_fraction.numerator * self.denominator
    if self_num > other_num
      true
    else
      false
    end
  end

  def <(other_fraction)
    self_num = self.numerator * other_fraction.denominator
    other_num = other_fraction.numerator * self.denominator
    if self_num < other_num
      true
    else
      false
    end
  end


end
