class DsfrComponent::HeaderComponent::ToolLinkComponent < DsfrComponent::Base
  def initialize(title:, path:, html_attributes: {})
    @title = title
    @path = path

    super(html_attributes: html_attributes)
  end

  def call
    tag.a title, href: path, **html_attributes
  end

private

  attr_reader :title, :path

  def default_attributes
    { class: 'fr-btn' }
  end
end
