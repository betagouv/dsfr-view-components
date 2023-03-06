module DsfrComponent
  class TileComponent < DsfrComponent::Base
    # @param title [String] title (required)
    # @param url [String] url (required)
    # @param image_src [String] chemin vers l'image (optional)
    # @param image_alt [String] L'alternative de l'image. Doit a priori être vide si l'image est illustrative et n'apporte pas de valeur sémantique.
    # @param description [String] description (optional)
    # @param orientation [String] :horizontal or :vertical
    def initialize(title:, url:, image_src: nil, image_alt: "", description: nil, orientation: :vertical, classes: [], html_attributes: {})
      @title = title
      @url = url
      @image_src = image_src
      @image_alt = image_alt
      @description = description
      @orientation = orientation

      super(classes: classes, html_attributes: html_attributes)
    end

  private

    attr_reader :title, :url, :image_src, :image_alt, :description, :orientation

    def default_attributes
      k = %w[fr-tile fr-enlarge-link]
      k << "fr-tile--horizontal" if orientation.to_sym == :horizontal
      { class: k.join(" ") }
    end
  end
end
