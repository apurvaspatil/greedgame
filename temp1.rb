require 'pry'
def calculate_score(dice)
  triple_scores = [1000, 200, 300, 400, 500, 600]
  single_scores = [100, 0, 0, 0, 50, 0]
  score=0
  non_scoring_count = dice.length
  (1..6).each do |number|
    count = dice.count(number)
    score += triple_scores[number - 1] * (count / 3)
    if (count / 3) >= 1
      non_scoring_count -= 3
    end
    score += single_scores[number - 1] * (count % 3)
    if number == 1 || number == 5 && count % 3 != 0
      non_scoring_count -= count % 3
    end
    binding.pry
    
  end
  return [score , non_scoring_count]
end   
p calculate_score([1,1,1,1,5])

