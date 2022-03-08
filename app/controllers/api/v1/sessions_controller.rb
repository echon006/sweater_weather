class Api::V1::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: { data: { message: "Email or passowrd is incorrect."}}, status: 404 
    end
  end
end
