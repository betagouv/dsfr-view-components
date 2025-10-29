class DsfrComponent::AccordionComponent < DsfrComponent::Base
  include DsfrComponent::Traits::HeaderSizeable

  renders_many :sections, ->(title: nil, expanded: false, id: nil, html_attributes: {}, &block) do
    DsfrComponent::AccordionComponent::SectionComponent.new(
      expanded: expanded,
      html_attributes: html_attributes,
      title: title,
      id: id,
      header_level: header_level,
      &block
    )
  end

  def initialize(html_attributes: {}, header_level: nil)
    self.header_level = header_level

    super(html_attributes: html_attributes)
  end

private

  def default_attributes
    { class: %w(fr-accordions-group) }
  end
end
