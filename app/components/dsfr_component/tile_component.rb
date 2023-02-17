module DsfrComponent
  class TileComponent < DsfrComponent::Base
    # @param title [String] title (required)
    # @param url [String] url (required)
    # @param image_src [String] chemin vers l'image (optional)
    # @param image_alt [String] L'alternative de l'image. Doit a priori être vide si l'image est illustrative et n'apporte pas de valeur sémantique.
    # @param description [String] description (optional)
    # @param orientation [String] :horizontal or :vertical
    # @param title_tag [Symbol] :h1, :h2, :h3, :h4 (default), :h5, :h6
    def initialize(title:, url:, image_src: nil, image_alt: "", description: nil, orientation: :vertical, title_tag: :h4, classes: [], html_attributes: {})
      @title = title
      @url = url
      @image_src = image_src
      @image_alt = image_alt
      @description = description
      @orientation = orientation
      @title_tag = title_tag.to_sym

      raise ArgumentError if TITLE_TAGS.exclude?(title_tag)

      super(classes: classes, html_attributes: html_attributes)
    end

  private

    attr_reader :title, :url, :image_src, :image_alt, :description, :orientation, :title_tag

    def default_attributes
      k = %w[fr-tile fr-enlarge-link]
      k << "fr-tile--horizontal" if orientation.to_sym == :horizontal
      { class: k.join(" ") }
    end
  end
end
