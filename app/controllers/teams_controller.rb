class TeamsController < ApplicationController

  def index
    @teams = Unirest.get("http://localhost:3000/api/v2/teams").body
  end

  def show
    id = params[:id]
    @team = Unirest.get("http://localhost:3000/api/v2/teams/#{id}").body
  end

  def create
    @team = Team.create(
      state: params[:state],
      creature: params[:creature],
      sport: params[:sport]
      )
  end

end
