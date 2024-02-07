# frozen_string_literal: true

class Api::UsersController < Api::ApplicationController
  # BEGIN
  def index
    @users = User.all
    respond_with :api, @users.as_json
  end

  def show
    respond_with User.find(params[:id]).as_json
  end
  # END
end
