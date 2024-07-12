class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  protected

  def after_sign_up_path_for(resource)
    new_user_session_path
  end
end