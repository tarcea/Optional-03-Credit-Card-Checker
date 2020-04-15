def visa?(card)
  # TODO: A visa card starts with a 4
  no_spaces = card.delete(' ')
  if /^4/.match(no_spaces)
    true
  else
    false
  end
end

def mastercard?(card)
  # TODO: A mastercard card starts with a 5
  no_spaces = card.delete(' ')
  if /^5/.match(no_spaces)
    true
  else
    false
  end
end

def valid_card?(card)
  # TODO: Implement the validator. Return true if the card is valid, false otherwise.
  if card.length < 16
    false
  else
    # eliminate spaces from "card"
    no_spaces = card.delete(' ')
    # luhn algo:
    # double the value of every second digit
    my_array = no_spaces.split('')
    # p my_array
    my_map = my_array.map.with_index do |el, i|
      el = el.to_i
      i.even? ? el + el : el
    end
    # p my_map
    # if the result of doubling is > 9, then add the two digits
    step2_map = my_map.map do |element|
      if element > 9
        mini_array = element.to_s.split('')
        mini_array[0].to_i + mini_array[1].to_i
      else
        element
      end
    end
    # p step2_map
    sum = 0
    step2_map.each { |element| sum += element }
    if sum.zero?
      true
    elsif sum > 9
      mini_array = sum.to_s.split('')
      if mini_array[1].to_i.zero?
        true
      else
        false
      end
    end
  end
end
