require 'faker'
require 'fact_is_fact'
require 'colorize'

def int_check (prompt)
    begin
        puts prompt
        num_input = Integer(gets)
        return num_input
    rescue ArgumentError
        return false
    end
end

def number_fact
    num = int_check "Any particular number in mind? (any entry not an integer will give you a random number 1 to 100)"
    if num == false
        puts FactIsFact::Random.new(number: (rand(1..100))).trivia.colorize(:magenta)
    else
        puts FactIsFact::Random.new(number: num).trivia.colorize(:green)
    end
end

def quotes
    puts "Time for some famous last words."
    puts Faker::Quote.famous_last_words.colorize(:light_blue)
end

def random_facts
    continue = true
    
    while continue
        puts "What would you like to hear about today? (options: Chuck Norris, numbers, quote)"
        response = gets.downcase.strip
        
        case response
            when "chuck norris"
                puts Faker::ChuckNorris.unique.fact.colorize(:red)
            when "numbers"
                number_fact
            when "quote"
                quotes
            else
                puts "Whoops that's not an option today"
        end

    puts 'Want to try again? (type "exit" to quit or "again" to carry on)'
    exit_again = gets.downcase.strip
        until exit_again == "exit" || exit_again == "again"
            puts "Please try again. Exit or Again?"
            exit_again = gets.downcase.strip
        end
        if exit_again == "exit"
            continue = false
        end
    system "clear"
    end
end

random_facts

