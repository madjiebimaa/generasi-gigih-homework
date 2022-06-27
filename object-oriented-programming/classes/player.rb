class Player
  attr_reader :monsters

  def initialize(name)
    @name = name
    @monsters = []
  end

  def add_monster(monster)
    monsters << monster.dup
  end

  def to_s
    result = "#{@name}:\n"

    @monsters.each_with_index do |monster, index|
      result += monster.to_s
      if index < @monsters.size - 1
        result += ', '
      else
        result += "\n"
      end
    end

    result
  end

  def play_turn(own_card, opponent_card, opponent)
    print "#{@name}'s "
    @monsters[own_card - 1].attack(opponent.monsters[opponent_card - 1])
  end

  def decrease_buff_effect_duration
    @monsters.each do |monster|
      if monster.buff_effect_duration > 0
        if monster.is_burnt?
          monster.take_damage(monster.buff_effect_damage)
        end

        monster.buff_effect_duration -= 1
      else
        monster.buff_effect_name = ""
      end
    end
  end
end
