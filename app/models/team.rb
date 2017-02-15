class Team
  attr_accessor :id, :team_name, :sport

  def initialize(hash)
    @id = hash['id']
    @team_name = hash['team_name'].split.map(&:capitalize)*' '
    @sport = hash['sport']
  end

  def self.find(id)
    team_hash = Unirest.get("http://localhost:3000/api/v2/teams/#{id}").body
    Team.new(team_hash)
  end

  def self.all
    teams = []
    api_teams = Unirest.get("http://localhost:3000/api/v2/teams").body
    api_teams.each do |team_hash|
      teams << Team.new(team_hash)
    end 
    teams
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v2/teams/#{@id}").body
  end

end