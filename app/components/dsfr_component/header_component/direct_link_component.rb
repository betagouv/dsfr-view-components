class DsfrComponent::HeaderComponent::DirectLinkComponent < DsfrComponent::Base
  def initialize(title:, path:, active: false, classes: [], html_attributes: {})
    @title = title
    @path = path
    @active = active

    super(classes: classes, html_attributes: html_attributes)
  end

  def call
    tag.a(title, **html_attributes)
  end

private

  attr_reader :title, :path, :active

  def default_attributes
    { href: path, class: 'fr-nav__link', target: "_self" } \
      .merge(active ? { "aria-current": 'page' } : {})
  end
end
