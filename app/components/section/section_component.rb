# frozen_string_literal: true

class Section::SectionComponent < ViewComponent::Base

  def initialize(title:)
    @title = title
  end

  attr_reader :title
  
end
