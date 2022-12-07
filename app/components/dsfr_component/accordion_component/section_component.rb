class DsfrComponent::AccordionComponent::SectionComponent < DsfrComponent::Base
  attr_reader :title, :expanded

  alias_method :expanded?, :expanded

  # @param title [String] section title
  # @param expanded [Boolean] toggles section folding
  # @param id [String] the HTML id, optional if you want to reuse the anchor
  def initialize(title:, expanded: false, id: nil, classes: [], html_attributes: {})
    @title = title
    @expanded = expanded
    @id = id

    super(classes: classes, html_attributes: html_attributes)
  end

  def id
    @id ||= "accordion-section-#{SecureRandom.hex(4)}"
  end

private

  def default_attributes
    { class: class_names("fr-accordion").split }
  end
end
