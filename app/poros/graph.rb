class Graph
  BASE_URI = "https://image-charts.com/chart?"
                                    +"chbh=a"
                                    +"&chs=700x150"
                                    +"&cht=bhg"
                                    +"&chxt=y"
                                    +"&chds=0,120"
                                    +"&chco=fdb45c,27c9c2,1869b7"
                                    +"&chbr=5"
                                    +"&chxs=0,000000,0,0,_"
                                    +"&chm=N,000000,0,,10|N,000000,1,,10|N,000000,2,,10"
                                    +"&chma=0,0,10,10"
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
    Graph.new("10_Highest", uri)
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
    Graph.new("10_Lowest", uri)
  end
end
