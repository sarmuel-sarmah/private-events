class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]
  def show
    @events = current_user.events
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
