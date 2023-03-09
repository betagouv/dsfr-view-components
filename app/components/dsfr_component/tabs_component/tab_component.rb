class DsfrComponent::TabsComponent::TabComponent < DsfrComponent::Base
  # @param title [String] Le titre de l’onglet affiché dans la barre d’onglets
  # @param active [Boolean] Définit si l’onglet est actif ou non
  # @param path [String] (optionnel) chemin vers lequel l’onglet pointe, utilisable avec Turbo Drive, transforme le bouton en lien, avec une turbo action `advance`
  def initialize(title:, active: false, path: nil, classes: [], html_attributes: {})
    @title = title
    @active = active
    @path = path

    super(classes: classes, html_attributes: html_attributes)
  end

  def nav_id
    @nav_id ||= "tab-#{title_slug}-nav"
  end

  def panel_id
    @panel_id ||= "tab-#{title_slug}-panel"
  end

  def nav_item
    path ? nav_link : nav_button
  end

  def call
    tag.div(**html_attributes) { content }
  end

private

  attr_reader :title, :active, :path

  def default_attributes
    classes = ['fr-tabs__panel']
    classes << "fr-tabs__panel--selected" if active
    { id: panel_id, class: classes, role: 'tabpanel', "aria-labelledby": nav_id }
  end

  def title_slug
    @title_slug ||= title.parameterize
  end

  def nav_button
    tag.button(title, **nav_html_attributes)
  end

  def nav_link
    tag.a(title, href: path, data: { turbo_action: "advance" }, **nav_html_attributes)
  end

  def nav_html_attributes
    { id: nav_id, class: 'fr-tabs__tab', role: 'tab', "aria-selected": active ? "true" : "false", "aria-controls": panel_id }
  end
end
