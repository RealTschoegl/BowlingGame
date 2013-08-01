class BowlingGame
  def initialize
    @rolls = []
  end

  # Record a roll in the game.
  #
  # pins - The Integer number of pins knocked down in this roll.
  #
  # Pushes # of pins to array @rolls.
  def roll(pins)
    @rolls.push(pins)
  end

  def score
    total_score  = 0
    current_roll = 0

    while current_roll < @rolls.size - 1
      roll      = @rolls[current_roll]
      next_roll = @rolls[current_roll + 1]
      another_roll = @rolls[current_roll + 2]

      if strike?(roll)
        total_score += score_strike(next_roll, another_roll)
        current_roll += 1
      elsif spare?(roll, next_roll)
        total_score += score_spare(another_roll)
        current_roll += 2
      else
        total_score += score_normal(roll, next_roll)
        current_roll += 2
      end
    end

    return total_score

  end

  private

  def strike?(roll)
    roll == 10
  end

  def spare?(roll, next_roll)
    roll + next_roll == 10
  end

  def score_strike(next_roll, another_roll)
    10 + next_roll + another_roll
  end

  def score_spare(another_roll)
    10 + another_roll
  end

  def score_normal(roll, next_roll)
    roll + next_roll
  end

end