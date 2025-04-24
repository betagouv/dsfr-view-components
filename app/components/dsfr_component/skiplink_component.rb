module DsfrComponent
  class SkiplinkComponent < DsfrComponent::Base
    # @param label [String] le texte utilisé pour le aria-label de la nav qui affiche les liens d’évitement (par exemple « Accès rapide »)
    # @param links [Array] liste de liens HTML
    def initialize(label:, links:, html_attributes: {})
      @label = label
      @links = links

      super(html_attributes: html_attributes)
    end

  private

    attr_reader :label, :links

    def default_attributes
      { class: 'fr-skiplinks' }
    end
  end
end
