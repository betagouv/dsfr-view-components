# frozen_string_literal: true

module DsfrComponent
  class CalloutComponent < DsfrComponent::Base
    include DsfrComponent::Traits::HeaderSizeable

    renders_one :action_zone

    # @param title [String] Le titre de la mise en avant (optionnel)
    # @param icon_name [String] Le nom de l'icône à afficher (exemple `arrow-right-line`), ou `:none` pour la désactiver (optionnel)
    # @param accent [String] La couleur d'accent (exemple `green-tilleul-verveine`) (optionnel)
    # @param header_level [Integer] Le niveau de titre (optionnel)
    def initialize(
      title: nil,
      icon_name: "information-line",
      accent: nil,
      header_level: nil,
      html_attributes: {}
    )
      @title = title
      @icon_name = icon_name
      @accent = accent
      self.header_level = header_level

      super(html_attributes: html_attributes)
    end

    def call
      tag.div(**html_attributes) do
        concat content_tag(header_tag, @title, class: 'fr-callout__title') if @title

        concat content_tag(:p, content, class: 'fr-callout__text')

        concat action_zone if action_zone?
      end
    end

  private

    def default_attributes
      classes = ["fr-callout"]

      classes.push("fr-icon-#{@icon_name}") unless @icon_name == :none
      classes.push("fr-callout--#{@accent}") if @accent

      { class: classes.join(" ") }
    end
  end
end
