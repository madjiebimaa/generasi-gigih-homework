class Monster
  attr_reader :name, :attack_point
  attr_accessor :buff_effect_name, :buff_effect_duration, :buff_effect_damage

  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    @buff_effect_name = ""
    @buff_effect_duration = 0
    @buff_effect_damage = 0
  end

  def to_s
    if @hitpoint > 0 && @buff_effect_name != "" && @buff_effect_duration != 0
      "#{@name}[#{@hitpoint}][#{@buff_effect_name}]"
    elsif @hitpoint > 0
      "#{@name}[#{@hitpoint}]"
    else
      "#{@name}[X]"
    end
  end

  def attack(monster)
    if is_frozen?
      puts "#{@name} is in frozen state, can't attack"
    else
      monster.take_damage(@attack_point)
      take_damage(0.5 * monster.attack_point)

      puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
    end
  end

  def take_damage(amount)
    @hitpoint -= amount
  end

  def is_frozen?
    @buff_effect_name == "frozen"
  end

  def is_burnt?
    @buff_effect_name == "burnt"
  end
end
