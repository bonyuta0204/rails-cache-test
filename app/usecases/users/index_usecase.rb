# app/usecases/Users::IndexUsecase.rb
module Users
  # Users::IndexUsecase
  class IndexUsecase
    def initialize; end

    def call
      users = User.all
      [:ok, users]
    end
  end
end
