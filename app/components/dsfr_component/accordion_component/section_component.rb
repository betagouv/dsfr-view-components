class DsfrComponent::AccordionComponent::SectionComponent < DsfrComponent::Base
  attr_reader :title, :expanded

  # renders_one :heading_html
  # renders_one :summary_html

  alias_method :expanded?, :expanded

  def initialize(title:, expanded:, id: nil, classes: [], html_attributes: {})
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
