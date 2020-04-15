def visa?(card)
  # TODO: A visa card starts with a 4
  no_spaces = card.delete(' ')
  /^4/.match(no_spaces) ? true : false
end

def mastercard?(card)
  # TODO: A mastercard card starts with a 5
  no_spaces = card.delete(' ')
  /^5/.match(no_spaces) ? true : false
end

def valid_card?(card)
  # TODO: Implement the validator. Return true if the card is valid
  if card.length < 16
    false
  else
    # luhn algo: 1. double the value of every second digit
    my_map = card.delete(' ').split('').map.with_index do |el, i|
      i.even? ? el.to_i + el.to_i : el.to_i
    end
    step2_map = my_map.map do |el|
      el > 9 ? el.to_s.split('')[0].to_i + el.to_s.split('')[1].to_i : el
    end
    sum = 0
    step2_map.each { |element| sum += element }
    if sum.zero?
      true
    elsif sum > 9
      sum.to_s.split('')[1].to_i.zero? ? true : false
    end
  end
end
