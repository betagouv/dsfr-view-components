class DsfrComponent::AccordionComponent < DsfrComponent::Base
  DEFAULT_HEADER_LEVEL = 3

  attr_reader :starting_header_level

  renders_many :sections, ->(title: nil, expanded: false, id: nil, classes: [], html_attributes: {}, &block) do
    DsfrComponent::AccordionComponent::SectionComponent.new(
      classes: classes,
      expanded: expanded,
      html_attributes: html_attributes,
      title: title,
      id: id,
      starting_header_level: starting_header_level,
      &block
    )
  end

  def initialize(classes: [], html_attributes: {}, starting_header_level: DEFAULT_HEADER_LEVEL)
    @starting_header_level = starting_header_level

    super(classes: classes, html_attributes: html_attributes)
  end

private

  def default_attributes
    { class: %w(fr-accordions-group) }
  end
end
