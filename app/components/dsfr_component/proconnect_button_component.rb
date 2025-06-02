module DsfrComponent
  class ProconnectButtonComponent < DsfrComponent::Base
    using HTMLAttributesUtils

    # @param target [String] la cible où POST le formulaire/bouton
    # @param button_overrides [Hash] attributs pour surcharger le bouton
    def initialize(target:, button_overrides: {}, html_attributes: {})
      @target = target
      @button_overrides = button_overrides

      super(html_attributes: html_attributes)
    end

  private

    attr_reader :target, :button_overrides

    def button_attributes
      default_button_attributes
        .deep_merge_html_attributes(button_overrides)
    end

    def default_button_attributes
      {
        method: :post,
        remote: false,
        class: "fr-connect",
        data: { turbo: false }
      }
    end

    def default_attributes
      { class: "fr-connect-group" }
    end
  end
end
