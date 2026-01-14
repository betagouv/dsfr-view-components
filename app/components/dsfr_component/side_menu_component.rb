module DsfrComponent
  class SideMenuComponent < DsfrComponent::Base
    renders_many :items, "DsfrComponent::SideMenuComponent::ItemComponent"

    # @param title [String] title of the side menu
    def initialize(title:, html_attributes: {})
      @title = title

      super(html_attributes:)
    end

  private

    attr_reader :title

    def default_attributes
      { class: 'fr-sidemenu', role: 'navigation', "aria-labelledby": "sidemenu-title-#{object_id}" }
    end
  end
end
