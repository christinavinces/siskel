require 'httparty'

class Siskel
  attr_accessor :title, :rating, :year, :plot, :consensus

  def initialize(title, options={})
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{options[:year]}&plot=#{options[:plot]}")
    @title = @movie['Title'] || "Movie not found!"
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']

    if @movie['Metascore'].to_i > 50
      @consensus = "Thumbs Up" 
    else
	  @consensus = "Thumbs Down"
    end
  end
end
