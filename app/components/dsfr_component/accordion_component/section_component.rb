class DsfrComponent::AccordionComponent::SectionComponent < DsfrComponent::Base
  include DsfrComponent::Traits::HeaderSizeable

  attr_reader :title, :expanded, :starting_header_level

  alias_method :expanded?, :expanded

  # @param title [String] section title
  # @param expanded [Boolean] toggles section folding
  # @param id [String] the HTML id, optional if you want to reuse the anchor
  def initialize(
    title:,
    starting_header_level:,
    expanded: false,
    id: nil,
    html_attributes: {}
  )
    @title = title
    @expanded = expanded
    @id = id
    @starting_header_level = starting_header_level

    super(html_attributes: html_attributes)
  end

  def id
    @id ||= "accordion-section-#{SecureRandom.hex(4)}"
  end

private

  def default_attributes
    { class: class_names("fr-accordion").split }
  end
end
