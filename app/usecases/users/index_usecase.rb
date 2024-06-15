# frozen_string_literal: true

# app/usecases/Users::IndexUsecase.rb
module Users
  # Users::IndexUsecase
  class IndexUsecase
    def call
      users = User.all
      [:ok, users]
    end
  end
end
