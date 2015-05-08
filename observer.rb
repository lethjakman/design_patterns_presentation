class EvilGenius
  attr_accessor :minions, :money

  def initialize
    @minions = Array.new
    @money = 1_000
  end

  def add_minion
    minion = Minion.new
    minion.evil_genius = self
    @minions << minion
  end

  def inform profit
    @money += profit
  end

  def final_results
    if @money <= 0
      @minions.each { |minion| minion.fire }
    else
      @minions.each { |minion| minion.celebrate }
    end

    puts "The evil genius ended up with $#{@money}"
  end
end

class Minion
  attr_accessor :evil_genius

  def did_i_win profit
    if profit > 0
      puts "Yaaaay!"
    else
      puts "Waaaaah!"
    end
  end

  def fire
    puts ['Waaah', 'Nooooo', 'Uh oh', 'Whoops'].sample
  end

  def celebrate
    puts ['Yaaay', 'Woohoo', 'Yuss'].sample
  end

  def perform_heist
    profit = rand(-250_000..250_000)

    did_i_win profit

    evil_genius.inform(profit)
  end
end

gru = EvilGenius.new

5.times { gru.add_minion }

puts
puts "Perform Heists!"
gru.minions.each do |minion|
  minion.perform_heist
end

puts
puts "Announce results:"
gru.final_results
