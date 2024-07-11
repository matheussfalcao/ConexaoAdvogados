

require 'open-uri'
require 'nokogiri'

class LawyersController < ApplicationController

  def verify_oab
    oab_number = params[:oab_number]

    if oab_number.blank?
      render json: { error: 'Número da OAB não informado' }, status: :unprocessable_entity
      return
    end

    begin
      # URL da página de consulta pública da OAB
      url = "http://cna.oab.org.br/cna/faces/pages/cadastroAdvogado.jsf?consulta=1&idtInscricao=#{oab_number}"
      
      # Fazendo a requisição e parseando o HTML com Nokogiri
      html = URI.open(url)
      doc = Nokogiri::HTML(html)

      # Extraindo informações
      status_element = doc.at_css('.txtStatus')
      status = status_element.text.strip if status_element
      
      name_element = doc.at_css('.txtNome')
      name = name_element.text.strip if name_element

      render json: { status: status, name: name }
    rescue OpenURI::HTTPError => e
      render json: { error: 'Erro ao acessar a página de consulta da OAB' }, status: :unprocessable_entity
    rescue StandardError => e
      render json: { error: 'Erro na verificação da OAB' }, status: :unprocessable_entity
    end
  end
end
