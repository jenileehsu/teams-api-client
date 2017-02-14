class TeamsController < ApplicationController

  def show
    id = params[:id]
    @team = Unirest.get("http://localhost:3000/api/v2/teams/#{id}").body
  end

end
