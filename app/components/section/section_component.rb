# frozen_string_literal: true

class Section::SectionComponent < ViewComponent::Base

  def initialize(page_name:)
    @page_name = page_name
  end

end
