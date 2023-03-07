module Examples
  module ModalHelpers
    def modal_default
      <<~RAW
        = dsfr_modal(title: "Information importante", html_attributes: { id: "modal-1" }) do |component|
          %p Bonjour ceci est important
        = dsfr_button(label: "Ouvrir la modale", html_attributes: { "data-fr-opened": false, "aria-controls": "modal-1" })
      RAW
    end

    def modal_button
      <<~RAW
        = dsfr_modal(title: "Information importante", html_attributes: { id: "modal-2" }) do |component|
          - component.with_button do
            = dsfr_button label: "Valider"
          %p Bonjour ceci est très important
        = dsfr_button(label: "Ouvrir la modale", html_attributes: { "data-fr-opened": false, "aria-controls": "modal-2" })
      RAW
    end

    def modal_two_buttons
      <<~RAW
        = dsfr_modal(title: "Information importante", html_attributes: { id: "modal-3" }) do |component|
          %p Bonjour ceci est extrêmement important
          - component.with_button do
            = dsfr_button label: "Valider"
          - component.with_button do
            = dsfr_button label: "Annuler", level: :secondary, html_attributes: { "aria-controls": "modal-3" }
        = dsfr_button(label: "Ouvrir la modale", html_attributes: { "data-fr-opened": false, "aria-controls": "modal-3" })
      RAW
    end

    def modal_turbo
      <<~RAW
        = dsfr_modal(title: "Information importante", opened: true, html_attributes: { id: "modal-4" }) do |component|
          %p Bonjour ceci est crucial
          - component.with_button do
            = dsfr_link_to "Valider", "#", class: "fr-btn"
          - component.with_button do
            = dsfr_link_to  "Annuler", "#", class: "fr-btn fr-btn--secondary"
      RAW
    end
  end
end
