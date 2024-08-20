class PagesController < ApplicationController
  def home
    @user = current_user
    @page_name = "Home"
    # Rails.logger.debug("Page name: #{@page_name}") # Log para verificar o valor
    render 'home'
  end
end
