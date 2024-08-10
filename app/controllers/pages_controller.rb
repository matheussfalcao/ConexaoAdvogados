class PagesController < ApplicationController
  def home
    @user = current_user
    render 'home'
    @page_name = "Empresas"
  end
end
