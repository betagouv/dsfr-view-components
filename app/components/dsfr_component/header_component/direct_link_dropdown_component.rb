class DsfrComponent::HeaderComponent::DirectLinkDropdownComponent < DsfrComponent::Base
  renders_many :links, DsfrComponent::HeaderComponent::DirectLinkComponent

  def initialize(title:, active: false, html_attributes: {})
    @title = title
    @active = active

    super(html_attributes: html_attributes)
  end

  def call
    render(DsfrComponent::DropdownComponent.new(
             title: title,
             html_attributes: button_attributes,
             collapse_html_attributes: collapse_attributes
           )) do
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
    {}
  end

  def button_attributes
    { class: 'fr-nav__btn' }.merge(active ? { "aria-current": 'true' } : {})
  end

  def collapse_attributes
    { class: 'fr-menu', id: "menu-#{title.parameterize}" }
  end
end
