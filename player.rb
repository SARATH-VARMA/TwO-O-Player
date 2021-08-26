class Player

  attr_reader :name, :pet_name

  def initialize(name, pet_name = name, lives = 3)
    @name = name
    @pet_name = pet_name
    @lives = lives
    @total_lives = lives
  end

  def reduce_life
    if @lives > 0
      @lives -= 1
    end
  end

  def alive?
    @lives != 0
  end

  def current_stat
    "#{@lives}/#{@total_lives}"
  end

end