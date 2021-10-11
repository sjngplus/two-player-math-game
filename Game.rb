class Game

  attr_accessor :current_player
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @current_player = p2
  end  

  def question
    if @current_player == @player2
      self.current_player = @player1
    else
      self.current_player = @player2
    end

    num1 = rand(1..20)
    num2 = rand(1..20)

    puts "#{current_player.name}: What does #{num1} plus #{num2} equal?"
    answer = gets.chomp
    if answer.to_i == (num1 + num2)
      puts "Amazing! You are right."
      list_score
    else
      puts "Incorrect! Don't leave your house without a calculator!"
      @current_player.lose_lives 1
      list_score
    end    
  end
  

  def list_score
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3" 
  end


  def declare_winner
    puts "----- GAME OVER -----"
    unless @player1.lives
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
    else
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
    end
  end


  def play_game
    while @player1.lives > 0 && @player2.lives > 0
      puts "----- NEW TURN -----"
      question
    end    
    declare_winner
  end  
  
end