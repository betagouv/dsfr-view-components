module DsfrComponent
  class HighlightComponent < DsfrComponent::Base
    # @param text [String] Le contenu textuel du composant
    # @param size [Symbol] La taille de la mise en exergue
    def initialize(text:, size: :md, html_attributes: {})
      @text = text
      @size = size

      raise ArgumentError if not SIZES.include?(size)

      super(html_attributes: html_attributes)
    end

    def call
      tag.div(**html_attributes) do
        tag.p(class: "fr-text--#{@size}") do
          @text
        end
      end
    end

  private

    attr_reader :text, :size

    def default_attributes
      { class: 'fr-highlight' }
    end
  end
end
