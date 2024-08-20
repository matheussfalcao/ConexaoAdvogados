# app/components/button_component.rb
class Button::ButtonComponent < ViewComponent::Base

  def initialize(text:, style_class: "", type: "button")
    @text = text
    @style_class = style_class
    @type = type
  end

  # Atributos acessíveis no template
  attr_reader :text, :style_class, :type
end
