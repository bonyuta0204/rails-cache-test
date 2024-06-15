# frozen_string_literal: true

# lib/generators/usecase/usecase_generator.rb
require 'rails/generators'

class UsecaseGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_usecase_file
    template 'usecase.rb.tt', File.join('app/usecases', class_path, "#{file_name}_usecase.rb")
  end

  def create_spec_file
    template 'usecase_spec.rb.tt', File.join('spec/usecases', class_path, "#{file_name}_usecase_spec.rb")
  end
end
