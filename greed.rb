require 'pry'
def calculate_score(dice)
  triple_scores = [1000, 200, 300, 400, 500, 600]
    single_scores = [100, 0, 0, 0, 50, 0]
    score=0
    (1..6).each do |number|
      count = dice.count(number)
      score += triple_scores[number - 1] * (count / 3)
      score += single_scores[number - 1] * (count % 3)
      #require 'pry';binding.pry
    end
    score
end   
# p calculate_score([1,1,1,1,5])

class DiceSet
  attr_accessor :values
  def roll(number_of_rolls)
    @values=[]
    i=0
    while i < number_of_rolls
      @values << rand(1..6)
      i += 1
    end
    @values
    
  end
end


def turn(scores, player)
  puts "Player #{player} turn -----"
  dice = DiceSet.new()
  dice.roll(5)
  roll = dice.values

  puts "The roll is: #{roll.inspect}"
  score = calculate_score(roll)
  puts "Score of #{player}: #{score}"
  scores[player] += score
  scores
end

# turn()


n = gets.chomp.to_i

scores = []
(0...n).each do |i|
  scores.push(0)
end

# binding.pry
# current_player = 0

round = 0

def did_anyone_win(scores)
  scores.each do |score|
    if score >= 1000
      return true
    end
  end
  return false
end


while !did_anyone_win(scores)
  
  puts "Round #{round}"
  (0...n).each do |player|
    scores = turn(scores, player)
  end
  puts "Scores: #{scores}"
  
  round += 1
  puts ""
end
