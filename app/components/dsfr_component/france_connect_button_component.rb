module DsfrComponent
  class FranceConnectButtonComponent < DsfrComponent::Base
    using HTMLAttributesUtils

    # @param target [String] la cible où POST le formulaire/bouton
    # @param use_plus_version [Boolean] utiliser la variante FranceConnect+
    # @param button_overrides [Hash] attributs pour surcharger le bouton
    def initialize(target:, use_plus_version: false, button_overrides: {}, html_attributes: {})
      @target = target
      @use_plus_version = use_plus_version
      @button_overrides = button_overrides

      super(html_attributes: html_attributes)
    end

  private

    attr_reader :target, :use_plus_version, :button_overrides

    def use_plus_version?
      use_plus_version
    end

    def info_link_href
      use_plus_version? ? "https://www.franceconnect.gouv.fr/franceconnect-plus/" : "https://www.franceconnect.gouv.fr/"
    end

    def info_link_label
      use_plus_version? ? "Qu’est-ce que FranceConnect+ ?" : "Qu’est-ce que FranceConnect ?"
    end

    def button_attributes
      default_button_attributes
        .deep_merge_html_attributes(button_overrides)
    end

    def default_button_attributes
      {
        method: :post,
        remote: false,
        class: use_plus_version? ? "fr-connect fr-connect--plus" : "fr-connect",
        data: { turbo: false }
      }
    end

    def default_attributes
      { class: "fr-connect-group" }
    end
  end
end
