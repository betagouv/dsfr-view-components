class DsfrComponent::SideMenuComponent::ItemComponent < DsfrComponent::Base
  MAX_LEVEL = 3

  renders_many :sub_items, ->(title:, path:, current_page: false, html_attributes: {}) {
    DsfrComponent::SideMenuComponent::ItemComponent.new(title:, path:, current_page:, level: @level + 1, html_attributes:)
  }

  # @param title [String] title of the side menu item
  # @param path [String] path of the side menu item
  # @param current_page [Boolean] active current page style
  # @param level [Integer] nesting level (1-3), automatically set for sub_items
  def initialize(title:, path:, current_page: false, level: 1, html_attributes: {})
    raise ArgumentError, "Le menu latéral ne supporte pas plus de #{MAX_LEVEL} niveaux" if level > MAX_LEVEL

    @title = title
    @path = path
    @current_page = current_page
    @level = level

    super(html_attributes: html_attributes)
  end

  private

  attr_reader :title, :path

  def default_attributes
    { class: 'fr-sidemenu__item' }
  end
end
