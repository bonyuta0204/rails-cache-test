# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    status, response = Users::IndexUsecase.new.call

    render json: response, status:
  end
end
