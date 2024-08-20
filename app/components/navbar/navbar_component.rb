# frozen_string_literal: true

class Navbar::NavbarComponent < ViewComponent::Base

  def initialize(page_name:)
    @page_name = page_name
  end

end
