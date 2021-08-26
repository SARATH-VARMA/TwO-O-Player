require './player'
require './question'

class Game

  PLAYING = 'playing'
  FINISHED = 'finished'

  def initialize
    @players = []
    @players << Player.new("Player 1", "P1")
    @players << Player.new("Player 2", "P2")
    @current_player = nil
    @winner = nil
    @game_status = PLAYING
  end

  def play_game
    reset_game
    until @game_status == FINISHED
      game_turn
      if @game_status == PLAYING
        puts game_score
        puts "----- NEW TURN -----"
        switch_player
      end
    end
    switch_player
    @winner = @players[@current_player]
    puts win_message
    puts "----- GAME OVER -----"
  end

  private

  attr_accessor :current_player, :winner

  def game_turn
    problem = Question.new
    input_status = false
    until input_status do
      puts "#{@players[@current_player].name}: #{problem.problem}"
      answer = gets.chomp
      input_status = numeric?(answer)
    end
    answer = answer.to_i
    if !problem.correct?(answer)
      @players[@current_player].reduce_life
      puts wrong_ans_message
      if !(@players[@current_player].alive?)
        @game_status = FINISHED
      end
    else
      puts right_ans_message
    end
  end

  def switch_player
    if @current_player == 0
      @current_player = 1
    else
      @current_player = 0
    end
  end

  def numeric?(str)
    Integer(str) != nil rescue false
  end

  def wrong_ans_message
    "#{@players[@current_player].name}: Seriously? No!"
  end

  def win_message
    "#{@winner.name} wins with a score of #{@winner.current_stat}"
  end

  def right_ans_message
    "#{@players[@current_player].name}: YES! You are correct."
  end

  def game_score
    "#{@players[0].pet_name}: #{@players[0].current_stat} vs #{@players[1].pet_name}: #{@players[1].current_stat}"
  end

  def reset_game
    @players = []

    @players << Player.new("Player 1", "P1")
    @players << Player.new("Player 2", "P2")
    @current_player = 0
    @winner = nil
    @game_status = PLAYING
  end

end