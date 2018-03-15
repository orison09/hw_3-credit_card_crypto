module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    

    # TODO: use the integers in nums_a to validate its last check digit
    chknum = nums_a[nums_a.size - 1]

    arry = nums_a.shift(nums_a.size - 1)
    arry.reverse  

    arry.each_with_index do |item,index| 
    if (index %2 ==0) then 
      arry[index] = arry[index]*2
    end
   end

   arry.each_with_index do |item,index| 
    if (item > 9) then 
      arry[index] = arry[index] - 9
    end
   end

  sum = 0 
  arry.each {|a| sum+=a}
  chk = sum % 10

  if (chk == chknum)
    valid = true 
  else 
    valid = false 
  end

  valid 
  end
end
