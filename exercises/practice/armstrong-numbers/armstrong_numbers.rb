module ArmstrongNumbers
  def self.include?(number)
    # Write your code here
    exponent = number.digits.length
    number.digits.sum { |digit| digit**exponent } == number
  end
end
