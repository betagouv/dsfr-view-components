module DsfrComponent
  class TooltipComponent < DsfrComponent::Base
    TYPES = %i[click hover].freeze

    attr_reader :id

    # @param text [String] Le texte affiché dans l’infobulle
    # @param label [String] Le libellé du déclencheur, obligatoire sans bloc
    # @param type [Symbol] Le déclenchement : :click (défaut, bouton avec une icône « ? ») ou :hover (lien, ou élément fourni par un bloc) (optionnel)
    # @param href [String] L’URL du lien déclencheur, uniquement pour le type :hover sans bloc. Par défaut : `#` suivi de l’id de l’infobulle (optionnel)
    def initialize(text:, label: nil, type: :click, href: nil, html_attributes: {})
      @text = text
      @label = label
      @id = html_attributes[:id] || "tooltip-#{object_id}"
      @type = type
      @href = href

      super(html_attributes: html_attributes)
    end

    def call
      validate_type
      validate_href
      validate_trigger

      safe_join([trigger, tag.span(text, **html_attributes)])
    end

  private

    attr_reader :text, :label, :type, :href

    def validate_type
      raise(ArgumentError, "`type` should be one of #{TYPES}") if TYPES.exclude?(type)
    end

    def validate_href
      raise ArgumentError, "href cannot be used together with the :click type" if type == :click && href.present?
    end

    def validate_trigger
      if content.present?
        raise ArgumentError, "a block can only be used with the :hover type" if type == :click
        raise ArgumentError, "label and href cannot be used together with a block" if label.present? || href.present?
      elsif label.blank?
        raise ArgumentError, "`label` is required unless a block is given"
      end
    end

    def default_attributes
      { class: %w[fr-tooltip fr-placement], id: id, role: "tooltip" }
    end

    def trigger
      if content.present?
        content
      elsif type == :hover
        tag.a(label, class: "fr-link", "aria-describedby": id, href: href || "##{id}")
      else
        tag.button(label, class: "fr-btn--tooltip fr-btn", type: "button", "aria-describedby": id)
      end
    end
  end
end
