require 'pry'
def calculate_score(dice)
  return 0 if dice == []
  final_score = 0
  dice.sort!

  if dice[1] == dice[0] && dice[2] ==dice[0]
    if dice[0] == 1
      final_score += 1000
    elsif dice[0] == 2
      final_score += 200
    elsif dice [0] == 3
      final_score += 300
    elsif dice[0] == 4
      final_score += 400
    elsif dice[0] == 5
      final_score += 500
    elsif dice[0] == 6
      final_score += 600
    end
    3.times do dice.shift end
  end
  # binding.pry
  dice.each do |item|
    if item == 5
      final_score += 50
    elsif item == 1 
      final_score += 100
      # 2.times do dice.shift end 
      
    end
  end
  # p dice
  final_score
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
