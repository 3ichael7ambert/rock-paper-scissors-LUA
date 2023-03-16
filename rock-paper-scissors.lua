-- "Rock, Paper, Scissors" Game

math.randomseed(os.time()) -- Seed random number generator with current time

local function welcome_message()
    print("Welcome to 'Rock, Paper, Scissors' game!")
    print("You will be playing against the computer.")
    print("Type 'rock', 'paper', or 'scissors' to make your move.")
end

local function get_user_input()
    local input
    repeat
        print("Please enter your move (rock, paper, or scissors):")
        input = io.read("*line")
    until input and (input == "rock" or input == "paper" or input == "scissors")
    return input
end

local function get_computer_move()
    local moves = {"rock", "paper", "scissors"}
    return moves[math.random(1, 3)]
end

local function evaluate_moves(user_move, computer_move)
    if user_move == computer_move then
        return "draw"
    elseif (user_move == "rock" and computer_move == "scissors") or
           (user_move == "paper" and computer_move == "rock") or
           (user_move == "scissors" and computer_move == "paper") then
        return "win"
    else
        return "lose"
    end
end

local function main()
    welcome_message()
    
    while true do
        local user_move = get_user_input()
        local computer_move = get_computer_move()
        print("Computer move: " .. computer_move)

        local result = evaluate_moves(user_move, computer_move)
        if result == "draw" then
            print("It's a draw!")
        elseif result == "win" then
            print("You win!")
        else
            print("You lose!")
        end

        print("Do you want to play again? (yes/no)")
        local play_again = io.read("*line")
        if play_again ~= "yes" then
            break
        end
    end
end

main()
