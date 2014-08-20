require 'csv'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

teams_info = []
CSV.foreach("teams.csv",headers:true,header_converters: :symbol) do |row|
  teams_info << row.to_hash
end

###methods#########
  #method for 4 teams##
def pic_team (array)
  teams = []
  array.each do |row|
  teams << row[:team]
 end
teams.uniq
end

  #method for if a team is within a row put them in an array
def players(team)
  field= []
  CSV.foreach("teams.csv", headers:true,header_converters: :symbol) do |row|
    if row[:team] == team
      field << row.to_hash
     end
  end
  field
end


def position (position)
  array = []
  CSV.foreach("teams.csv", headers:true,header_converters: :symbol) do |row|
    if row[:position] == position
      array << row.to_hash
    end
  end
  array
end



###get method#####

#get method for teams on kickball page
get '/' do
  @team = pic_team(teams_info)
erb :home
end

get '/player/:team' do
  @player = players(params[:team])
erb :player
end

get '/positions/:position' do
  @position = position(params[:position])
  erb :positions
end



