require 'date'

class Seasons
  # The name of seasons for each "region".
  # Must be defined in order, starting with the first
  # complete season of the year
  @@season_names = {
      :north => [:spring, :summer, :autumn, :winter],
      :south => [:autumn, :winter, :spring, :summer]
  }

  # Initializes the Seasons class
  #
  # * *Args*    :
  #   - +date+ -> the DateTime object to inspect
  #   - +region+ -> the region to use.  :north or :south
  # * *Raises* :
  #   - +ArgumentError+
  #
  def initialize(date, region)
    raise(ArgumentError, 'date param must be a Date or DateTime object') unless date.is_a? Date
    raise(ArgumentError, 'region parameter does not match a known region') unless @@season_names.has_key? region

    @date = date.to_date
    @region = region

    @firstSeasonStart = Date.new(@date.year, 3, 1)
    @secondSeasonStart = Date.new(@date.year, 6, 1)
    @thirdSeasonStart = Date.new(@date.year, 9, 1)
    @fourthSeasonStart = Date.new(@date.year, 12, 1)
  end

  # Calculates the season that the supplied date falls within
  #
  # * *Returns* the season that the date falls within
  #
  def checkSeason
    # Check if the supplied date falls between the start and end of each season
    if (@firstSeasonStart..@secondSeasonStart -1).include?(@date)
      @@season_names[@region][0]
    elsif (@secondSeasonStart..@thirdSeasonStart -1).include?(@date)
      @@season_names[@region][1]
    elsif (@thirdSeasonStart..@fourthSeasonStart -1).include?(@date)
      @@season_names[@region][2]
    else
      @@season_names[@region][3]
    end
  end
end

