module DsfrComponent
  class HighlightComponent < DsfrComponent::Base
    # @param text [String] Le contenu textuel du composant
    # @param size [Symbol] La taille de la mise en exergue
    def initialize(text: nil, size: :md, html_attributes: {})
      @text = text
      @size = size

      super(html_attributes: html_attributes)
    end

    def call
      raise(ArgumentError, "You must provide either a text param or some block content") if no_content?
      raise(ArgumentError, "Size '#{size}' is not allowed; possible values are #{SIZES}") if SIZES.exclude?(size)

      tag.div(**html_attributes) do
        tag.p(class: "fr-text--#{@size}") do
          @text || content
        end
      end
    end

  private

    attr_reader :text, :size

    def default_attributes
      { class: 'fr-highlight' }
    end

    def no_content?
      text.blank? && !content?
    end
  end
end
