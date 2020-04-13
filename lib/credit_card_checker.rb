def visa?(card)
  # TODO: A visa card starts with a 4
 if /^4/.match(card)
  return true
    else
  return false
  end
end

def mastercard?(card)
  # TODO: A mastercard card starts with a 5
 p /^5/.match(card)
end

def valid_card?(card)
  # TODO: Implement the validator. Return true if the card is valid, false otherwise.
end
