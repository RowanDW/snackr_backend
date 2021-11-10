class Graph
  BASE_URI = 'https://image-charts.com/chart?chbh=a&chs=700x150&cht=bhg&chxt=y&chds=0,120&chco=005689,007cb9,ff895d&chbr=5&chxs=0,000000,0,0,_&chm=N,FFFFFF,0,,10|N,FFFFFF,1,,10|N,FFFFFF,2,,10|N,FFFFFF,3,,10|N,FFFFFF,4,,10|N,FFFFFF,5,,10|N,FFFFFF,6,,10|N,FFFFFF,7,,10|N,FFFFFF,8,,10|N,FFFFFF,9,,10&chma=0,0,10,10'

  attr_reader :name, :uri

  def initialize(name, uri)
    @name = name
    @uri = uri
  end

  def self.ten_highest_ranked(current_user)
    ten_highest = FoodEntry.ten_highest_ranked(current_user)
    food_names = []
    avg_ranks = []
    ten_highest.each do |food|
      food_names << food.food_name
      avg_ranks << food.average_rank
    end
    uri = "#{BASE_URI}&chd=t:#{avg_ranks.join('|')}&chdl=#{food_names.join('|')}"
    Graph.new('10_Highest', uri)
  end

  def self.ten_lowest_ranked(current_user)
    ten_lowest = FoodEntry.ten_lowest_ranked(current_user)
    food_names = []
    avg_ranks = []
    ten_lowest.each do |food|
      food_names << food.food_name
      avg_ranks << food.average_rank
    end
    uri = "#{BASE_URI}&chd=t:#{avg_ranks.join('|')}&chdl=#{food_names.join('|')}"
    Graph.new('10_Lowest', uri)
  end
end
