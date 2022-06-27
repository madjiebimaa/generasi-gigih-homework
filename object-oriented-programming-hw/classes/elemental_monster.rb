require_relative 'monster'

class ElementalMonster < Monster
  def initialize(name, hitpoint, attack_point, buff_name, buff_duration, buff_percentage)
    super(name, hitpoint, attack_point)

    @buff_name = buff_name
    @buff_duration = buff_duration
    @buff_percentage = buff_percentage
  end

  def attack(monster)
    monster.buff_effect_name = @buff_name
    monster.buff_effect_duration = @buff_duration
    monster.buff_effect_damage = @buff_percentage * @attack_point
  end
end
