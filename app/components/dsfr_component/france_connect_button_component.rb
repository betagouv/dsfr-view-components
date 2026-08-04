module DsfrComponent
  class FranceConnectButtonComponent < DsfrComponent::Base
    using HTMLAttributesUtils

    # @param target [String] la cible où POST le formulaire/bouton
    # @param plus [Boolean] utiliser la variante FranceConnect+
    # @param button_overrides [Hash] attributs pour surcharger le bouton
    def initialize(target:, plus: false, button_overrides: {}, html_attributes: {})
      @target = target
      @plus = plus
      @button_overrides = button_overrides

      super(html_attributes: html_attributes)
    end

  private

    attr_reader :target, :plus, :button_overrides

    def plus?
      plus
    end

    def info_link_href
      plus? ? "https://franceconnect.gouv.fr/france-connect-plus" : "https://franceconnect.gouv.fr/"
    end

    def info_link_label
      plus? ? "Qu’est-ce que FranceConnect+ ?" : "Qu’est-ce que FranceConnect ?"
    end

    def button_attributes
      default_button_attributes
        .deep_merge_html_attributes(button_overrides)
    end

    def default_button_attributes
      {
        method: :post,
        remote: false,
        class: plus? ? "fr-connect fr-connect--plus" : "fr-connect",
        data: { turbo: false }
      }
    end

    def default_attributes
      { class: "fr-connect-group" }
    end
  end
end
