# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'King', 'Queen', 'Jack']

def blackjack_score(hand)
  score = 0
  number_aces = 0

  if hand.class != Array || hand.length < 1 || hand.length > 5
    raise ArgumentError, 'You need to send an array of 1-5 cards'
  end

  score = hand.sum do |card|
    unless VALID_CARDS.include? card
      raise ArgumentError, 'Invalid Card'
    end

    if card == 1
      number_aces += 1
      1
    elsif card.class == Integer
      card
    else
      10
    end
  end


  if score > 21
    raise ArgumentError, 'Busted!'
  end

  while score <= 11 && number_aces > 0
    number_aces -= 1
    score += 10
  end

  return score
end
