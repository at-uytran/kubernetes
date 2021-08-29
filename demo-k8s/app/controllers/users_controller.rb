class UsersController < ApplicationController
  def index
    render json: {data: User.limit(10).as_json(only: [:id, :name, :phone_number, :birthday])}
  end
end
