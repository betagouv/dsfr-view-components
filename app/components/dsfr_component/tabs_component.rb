class DsfrComponent::TabsComponent < DsfrComponent::Base
  renders_many :tabs, "DsfrComponent::TabsComponent::TabComponent"

  # @param label [String] Le nom du système d’onglets, sera uniquement affiché comme aria-label (optionnel)
  def initialize(label: nil, classes: [], html_attributes: {})
    @label = label
    @tabs = []

    super(classes: classes, html_attributes: html_attributes)
  end

private

  attr_reader :label

  def default_attributes
    { class: 'fr-tabs' }
  end
end
