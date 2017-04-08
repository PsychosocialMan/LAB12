class String
  def numeric?
    Float(self) != nil rescue false
  end
end

class PalindromeController < ApplicationController
  before_filter :authorize

  def input
  end

  def output
    n = (buf = params[:n]).numeric? ? buf.to_f : -1
    @result_array = find_them_all(n)
    @num = @result_array.length
  end

  def find_them_all(n)
    0.upto(n).select do |x|
			(flag = is_palindrome?(x)) && flag == is_palindrome?(x**2)
    end
  end

  def is_palindrome?(num)
    num.to_s.eql?(num.to_s.reverse)
  end
end
