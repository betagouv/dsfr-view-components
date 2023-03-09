class DsfrComponent::HeaderComponent::DirectLinkDropdownComponent < DsfrComponent::Base
  renders_many :links, DsfrComponent::HeaderComponent::DirectLinkComponent

  def initialize(title:, active: false, classes: [], html_attributes: {})
    @title = title
    @active = active

    super classes: classes, html_attributes: html_attributes
  end

  def call
    tag.button(title, **html_attributes) +
      tag.div(class: 'fr-collapse fr-menu', id: menu_id) do
        tag.ul(class: 'fr-menu__list') do
          links.map do |link|
            tag.li link.call
          end.join.html_safe
        end
      end
  end

private

  attr_reader :title, :active

  def default_attributes
    { class: 'fr-nav__btn', "aria-expanded": "false", "aria-controls": menu_id } \
      .merge(active ? { "aria-current": 'true' } : {})
  end

  def menu_id
    @menu_id ||= "menu-#{title.parameterize}"
  end
end
