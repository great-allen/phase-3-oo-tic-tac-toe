class TicTacToe
    attr_accessor :board
    WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    def initialize
        @board=[" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(str)
        str.to_i-1
    end
 
    def move(index,player_token="X")
        @board[index]=player_token
    end

    def position_taken?(index)
        @board[index]=="X" || @board[index]=="O"
    end

    def valid_move?(index)
        if index >=0 && index <=8 && @board[index] !="X" && @board[index] !="O"
           true
        else 
            false
        end  
    end

    def turn_count
        @board.count{|step| step != " " }
      end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Enter the number (1-9)"
        index=input_to_index(gets.chomp)
         if valid_move?(index)
        move(index,current_player)
        display_board
         else 
            turn
            
        end
    end

    def won?
        WIN_COMBINATIONS.any? do  |combo| 
           if position_taken?(combo[0]) && @board[combo[0]]==@board[combo[1]] && @board[combo[1]] ==@board[combo[2]]
             return combo
           end
        end
    end

    def full?
        @board.all? do |element|
              element =="X" || element =="O"
            
    end
    end

    def draw?
        full? && !won? 
        
    end

    def over?
        won? || draw?
    end

    def winner
      if a= won? 
        @board[a[0]]
      end
    end


    def play
      while ! over?
        turn
        
      end
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
end
end