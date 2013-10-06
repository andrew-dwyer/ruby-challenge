require 'date'

class Seasons
  @date


  def initialize(date)
    @date = date
    @springStart =  Date.new(@date.year, 9, 1)
    @summerStart =  Date.new(@date.year, 12, 1)
    @autumnStart =  Date.new(@date.year, 3, 1)
    @winterStart =  Date.new(@date.year, 6, 1)
  end

  def checkSeason
    print @date

    if (@autumnStart..@winterStart -1).include?(@date)
      'autumn'
    elsif (@winterStart..@springStart -1).include?(@date)
      'winter'
    elsif (@springStart..@summerStart -1).include?(@date)
      'spring'
    else
      'summer'
    end

  end
end