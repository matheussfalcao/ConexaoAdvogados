class PagesController < ApplicationController
  def welcome
    @user = current_user 
    render 'welcome'
  end
end
