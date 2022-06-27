require_relative 'elemental_monster'

class FireMonster < ElementalMonster
  def initialize(name, hitpoint, attack_point)
    super(name, hitpoint, attack_point, "burnt", 3, 40.to_f / 100)
  end

  def attack(monster)
    if is_frozen?
      puts "#{@name} is in frozen state, can't attack"
    else
      super(monster)
      monster.take_damage(0)
      take_damage(0.5 * monster.attack_point)

      puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals 0 damage, takes #{0.5 * monster.attack_point} damage, inflict burnt status for 3 turns with #{@attack_point * @buff_percentage} damage each turn
"
    end
  end
end
