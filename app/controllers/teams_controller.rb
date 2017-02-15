class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    id = params[:id]
    @team = Team.find(id)
  end

  def new
  end

  def create
    @team = Unirest.post("http://localhost:3000/api/v2/teams", :parameters => {state: params[:state], creature: params[:creature], sport: params[:sport]}).body
    redirect_to teams_path(@team['id'])
  end

  def edit
    id = params[:id]
    @team = Unirest.get("http://localhost:3000/api/v2/teams/#{id}").body
  end

  def update
    id = params[:id]
    @team = Unirest.patch("http://localhost:3000/api/v2/teams/#{id}", :parameters => {state: params[:state], creature: params[:creature], sport: params[:sport]}).body
    redirect_to teams_path(@team['id'])
  end

  def destroy
    id = params[:id]
    @team = Team.find(id)
    @team.destroy
    redirect_to teams_path
  end

end
