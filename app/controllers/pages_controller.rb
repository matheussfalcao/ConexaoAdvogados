class PagesController < ApplicationController
  def home
    @user = current_user
    # Rails.logger.debug("Page name: #{@page_name}") # Log para verificar o valor
    render 'home'
    console
  end
end
