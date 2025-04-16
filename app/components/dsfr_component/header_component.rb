class DsfrComponent::HeaderComponent < DsfrComponent::Base
  renders_one :search
  renders_one :operator_image, "DsfrComponent::HeaderComponent::OperatorImageComponent"
  renders_many :tool_links, "DsfrComponent::HeaderComponent::ToolLinkComponent"
  renders_many :direct_links, types: {
    simple: "DsfrComponent::HeaderComponent::DirectLinkComponent",
    dropdown: "DsfrComponent::HeaderComponent::DirectLinkDropdownComponent"
  }

  # @param logo_text [String] Ce texte obligatoire sera affiché en dessous de la Marianne et au dessus de la devise française. C’est généralement un nom de ministère ou d’administration.
  # @param title [String] Le nom du service numérique, titre principal du site.
  # @param tagline [String] La description du service numérique, sous-titre du site (optionnelle).
  def initialize(logo_text:, title: nil, tagline: nil, html_attributes: {})
    @logo_text = logo_text
    @title = title
    @tagline = tagline

    super(html_attributes: html_attributes)
  end

private

  attr_reader :logo_text, :title, :tagline

  def default_attributes
    { class: 'fr-header', role: 'banner' }
  end
end
