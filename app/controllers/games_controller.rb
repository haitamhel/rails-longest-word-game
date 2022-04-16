require "net/http"


class GamesController < ApplicationController
  def new
    @letter = ("a".."z").to_a.sample(10)
  end
  def score
    @letter = ("a".."z").to_a.sample(10)
    url = "https://wagon-dictionary.herokuapp.com/#{params[:question]}"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    @letter.each do |element|

    if element.include?(params[:question])
      return @display = "Sorry but the #{params[:question]} can't be built out of #{@letter.split("")}"
    elsif data["found"] == false
      return @display = "Sorry but #{params[:question]} does not seem be an english word"
    else
      return @display = "Congrats #{params[:question]} is a valid English word!!!"
    end
  end
  end
end
