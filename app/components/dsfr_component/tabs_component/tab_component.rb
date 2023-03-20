class DsfrComponent::TabsComponent::TabComponent < DsfrComponent::Base
  # @param title [String] Le titre de l’onglet affiché dans la barre d’onglets
  # @param active [Boolean] Définit si l’onglet est actif ou non
  # @param path [String] (optionnel) chemin vers lequel l’onglet pointe, utilisable avec Turbo Drive, transforme le bouton en lien, avec une turbo action `advance`
  # @param icon [String] (optionnel) icône affichée à gauche du titre de l’onglet (sans le préfixe `fr-icon-`)
  def initialize(title:, active: false, path: nil, icon: nil, classes: [], html_attributes: {})
    @title = title
    @active = active
    @path = path
    @icon = icon

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

  attr_reader :title, :active, :path, :icon

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
    classes = ["fr-tabs__tab"]
    classes += ["fr-icon-#{icon}", "fr-tabs__tab--icon-left"] if icon.present?
    { id: nav_id, class: classes, role: 'tab', "aria-selected": active ? "true" : "false", "aria-controls": panel_id }
  end
end
