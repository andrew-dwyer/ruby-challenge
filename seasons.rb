require 'date'

class Seasons
  @date

  @@season_names = {
      :north => [ :spring, :summer, :autumn, :winter ],
      :south => [ :autumn, :winter, :spring, :summer ]
  }

  def initialize(date, hemisphere)
    @date = date
    @hemisphere = hemisphere
    @firstSeasonStart =  Date.new(@date.year, 3, 1)
    @secondSeasonStart =  Date.new(@date.year, 6, 1)
    @thirdSeasonStart =  Date.new(@date.year, 9, 1)
    @fourthSeasonStart =  Date.new(@date.year, 12, 1)
  end

  def checkSeason
    print @date

    if (@firstSeasonStart..@secondSeasonStart -1).include?(@date)
      @@season_names[@hemisphere][0].to_s
    elsif (@secondSeasonStart..@thirdSeasonStart -1).include?(@date)
      @@season_names[@hemisphere][1].to_s
    elsif (@thirdSeasonStart..@fourthSeasonStart -1).include?(@date)
      @@season_names[@hemisphere][2].to_s
    else
      @@season_names[@hemisphere][3].to_s
    end

  end
end