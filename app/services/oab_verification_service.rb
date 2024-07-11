
require 'nokogiri'
require 'httparty'

class OabVerificationService
  def self.verify_registration(oab_number)
    # URL base da consulta de inscrições na OAB
    base_url = "https://www.oab.org.br/consulta-advogados/#{oab_number}"

    begin
      # Realiza a requisição GET para obter a página HTML
      response = HTTParty.get(base_url)
      html = Nokogiri::HTML(response.body)

      # Extrai informações relevantes da página
      status_element = html.at_css('.status')
      status = status_element&.text&.strip if status_element

      name_element = html.at_css('.name')
      name = name_element&.text&.strip if name_element

      { status: status, name: name }
    rescue HTTParty::Error, StandardError => e
      { error: "Erro na verificação da OAB: #{e.message}" }
    end
  end
end
