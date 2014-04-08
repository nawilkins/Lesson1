# Method determines whether or not the player wants to play another round
def card(person,remaining_deck,deck_values)
  card = rand(0...9)
  if remaining_deck[card] > 0
    card = deck_values[card]
    person.push deck_values[card]
    remaining_deck[card] = remaining_deck[card].to_i - deck_values[card].to_i
  else
    card(person,remaining_deck,deck_values)
  end
end

def score(person)
  length = person.length
  count = 0
  score = 0
  while count < length
    score += person[count]
    count += 1
  end
  return score
end


puts 'Hello, what is your name?'
name = gets.chomp
puts 'Hello ' + name + ', how much would you like in your bankroll?'
bankroll = gets.chomp
bankroll = bankroll.to_i


another_round = true

while another_round == true
  puts 'What is your wager this hand?'
  wager = gets.chomp.to_i
  while wager > bankroll
    puts 'You don\'t have a big enough bankroll. Please choose a different amount.'
    wager = gets.chomp.to_i
  end

  deck_values = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
  remaining_deck = [44, 8, 12, 16, 20, 24, 28, 32, 36, 40, 40, 40, 40]

  player = []
  dealer = []

  card(player,remaining_deck,deck_values)
  card(dealer,remaining_deck,deck_values)
  card(player,remaining_deck,deck_values)
  card(dealer,remaining_deck,deck_values)

  puts 'Your first card is ' + player[0].to_s
  puts 'Your second card is ' + player[1].to_s
  player_score = score(player)
  puts 'Your score is ' + player_score.to_s

  puts 'The dealer\'s first card is ' + dealer[0].to_s

  dealer_score = score(dealer)

  # Initial play loop
  while player_score <= 21
    puts "Your score is: #{player_score}"
    if player_score == 21
      puts 'You got a blackjack - you win!'
      bankroll += wager
      puts "Your bankroll is now #{bankroll}"
      break
    end
    puts 'Do you want to hit or stay?'
    hit_or_stay = gets.chomp
    if hit_or_stay.downcase == 'hit'
      card(player,remaining_deck,deck_values)
      player_score = score(player)
    elsif hit_or_stay.downcase == 'stay'
      break
    else
      puts 'I\'m sorry, you need to either hit or stay.'
    end
    if player_score > 22
      length = player.length
      count = 0
      while count < length
        if player[count] == 11
          player[count] = 1
        end
        count += 1
      end
      player_score = score(player)
    end
  end

  if player_score == 21
    break
  end

  player_score = score(player)
  puts "Your score is: #{player_score}"
  
  while player_score < 22
    while dealer_score < 18
      puts "the dealer\'s score is #{dealer_score}"
      card(dealer,remaining_deck,deck_values)
      dealer_score = score(dealer)
      if dealer_score > 22
        length = player.length
        count = 0
        while count < length
          if dealer[count] == 11
            dealer[count] = 1
          end
          count += 1
        end
        dealer_score = score(dealer)
      end
    end

    puts "the dealer\'s score is #{dealer_score}"

    if dealer_score > 21
      puts 'Dealer busts - you win!'
      bankroll += wager
      break
    elsif dealer_score > player_score
      puts 'Dealer Wins'
      bankroll -= wager
      puts "Your bankroll is now #{bankroll}"
      break
    else
      puts 'You win!'
      bankroll += wager
      puts "Your bankroll is now #{bankroll}"
      break
    end
  end

  if player_score > 21
    puts 'You bust - sorry!'
    bankroll -= wager
    puts "Your bankroll is now #{bankroll}"
  end
  
  response = 'none'
  while response == 'none'
    puts 'Do you want to play again - yes or no?'
    response = gets.chomp
    if response == 'no'
      another_round = false
      false
    elsif response == 'yes'
      another_round == true
      false
    else
      puts 'I\'m sorry, I need either a yes or no response.'
      response = 'none'
    end
  end
end
puts 'Thanks for playing.'