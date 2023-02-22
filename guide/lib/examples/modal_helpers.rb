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
          %p Bonjour ceci est important
          - component.with_button(label: "Valider")
        = dsfr_button(label: "Ouvrir la modale", html_attributes: { "data-fr-opened": false, "aria-controls": "modal-2" })
      RAW
    end

    def modal_two_buttons
      <<~RAW
        = dsfr_modal(title: "Information importante", html_attributes: { id: "modal-3" }) do |component|
          %p Bonjour ceci est important
          - component.with_button(label: "Valider")
          - component.with_button(label: "Annuler", level: :secondary, html_attributes: { "aria-controls": "modal-3" })
        = dsfr_button(label: "Ouvrir la modale", html_attributes: { "data-fr-opened": false, "aria-controls": "modal-3" })
      RAW
    end
  end
end

#   context "with title icon" do
#     let(:args) { { title: "Information importante", title_icon: "fr-icon-arrow-right-line", html_attributes: { id: "modal-1" } } }
#     let(:content) { "Bonjour ceci est important" }
#
#     it "renders correctly" do
#       expect(rendered_content).to have_tag(:dialog, with: { class: "fr-modal" }) do
#         with_tag(:div, with: { class: "fr-modal__body" }) do
#           with_tag(:h1, text: /Information importante/) do
#             with_tag(:span, with: { class: "fr-icon-arrow-right-line fr-fi--lg" })
#           end
#         end
#       end
#     end
#   end
#
#   context "with two buttons" do
#     subject! do
#       render_inline(described_class.new(title: "Information importante")) do |c|
#         c.with_button(label: "Annuler", level: :secondary)
#         c.with_button(label: "Valider")
#         "Bonjour ceci est important"
#       end
#     end
#
#     it "renders correctly" do
#       expect(rendered_content).to have_tag(:dialog, with: { class: "fr-modal" }) do
#         with_tag(:div, with: { class: "fr-modal__body" }, text: /Bonjour ceci est important/) do
#           with_tag(:h1, text: /Information importante/)
#         end
#         with_tag(:div, with: { class: "fr-modal__footer" }) do
#           with_tag(:button, with: { class: "fr-btn--secondary" }, text: /Annuler/)
#           with_tag(:button, with: { class: "fr-btn" }, text: /Valider/)
#         end
#       end
#     end
#   end
# end
