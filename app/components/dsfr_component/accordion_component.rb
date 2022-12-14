class DsfrComponent::AccordionComponent < DsfrComponent::Base
  renders_many :sections, ->(title: nil, expanded: false, id: nil, classes: [], html_attributes: {}, &block) do
    DsfrComponent::AccordionComponent::SectionComponent.new(
      classes: classes,
      expanded: expanded,
      html_attributes: html_attributes,
      title: title,
      id: id,
      &block
    )
  end

  def initialize(classes: [], html_attributes: {})
    super(classes: classes, html_attributes: html_attributes)
  end

private

  def default_attributes
    { class: %w(fr-accordions-group) }
  end
end
