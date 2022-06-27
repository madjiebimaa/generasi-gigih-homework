require_relative 'elemental_monster'

class IceMonster < ElementalMonster
  def initialize(name, hitpoint, attack_point)
    super(name, hitpoint, attack_point, "frozen", 1, 80.to_f / 100)
  end

  def attack(monster)
    if is_frozen?
      puts "#{@name} is in frozen state, can't attack"
    else
      super(monster)
      monster.take_damage(@attack_point * @buff_percentage)
      take_damage(0.5 * monster.attack_point)

      puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals #{@attack_point * @buff_percentage} damage, takes #{0.5 * monster.attack_point} damage, inflict frozen status for 1 turns with 0 damage each turn
"
    end
  end
end
