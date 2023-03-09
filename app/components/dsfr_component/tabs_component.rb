class DsfrComponent::TabsComponent < DsfrComponent::Base
  renders_many :tabs, "DsfrComponent::TabsComponent::TabComponent"

  # @param label [String] Le nom du système d’onglets, sera uniquement affiché comme aria-label (optionnel)
  def initialize(label: nil, classes: [], html_attributes: {})
    @label = label
    @tabs = []

    super(classes: classes, html_attributes: html_attributes)
  end

  def call
    raise ArgumentError, "You must provide at least one tab" if tabs.empty?

    tag.div(**html_attributes) do
      tag.ul(class: 'fr-tabs__list', role: "tablist", "aria-label": label) do
        tabs.map do |tab|
          tag.li(role: "presentation") do
            tab.nav_item
          end
        end.join.html_safe
      end +
        tabs.map(&:call).join.html_safe
    end
  end

private

  attr_reader :label

  def default_attributes
    { class: 'fr-tabs' }
  end
end
