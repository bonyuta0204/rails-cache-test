class UsersController < ApplicationController
  def index
    status, response = Users::IndexUsecase.new.call
    
      render json: response, status: status
  end
end
