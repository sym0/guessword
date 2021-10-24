class WordGuesserGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.
  
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  attr_accessor :word_with_guesses
  attr_accessor :check_win_or_lose
  attr_accessor :guessnum
  
  # Get a word from remote "random word" service
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @word_with_guesses = @word.gsub(/\w/,'-')
    @check_win_or_lose = :play
    @guessnum = 0
  end
  def guess(word)
    if word=~/[a-z]/
      @guessnum += 1
      if !(@guesses.include?word) and !(@wrong_guesses.include?word)
        if @word.include?word
          @guesses += word
          #替换word_with_guesses中猜对的单词
          i = @word.index(word)
          while i do
            @word_with_guesses[i]=word
            i = @word.index(word,i+1)
          end
        else
          @wrong_guesses += word
        end
      end
  
      if @guessnum>=@word.length
      	if @word_with_guesses.eql?(@word)
          @check_win_or_lose = :win
        else
          @check_win_or_lose = :lose
        end
      end
      
      return ((@guesses.empty?)||(@wrong_guesses.empty?))
    elsif word=~/[A-Z]/
      return false
    else
      raise ArgumentError
      return false
    end
  end
  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end
