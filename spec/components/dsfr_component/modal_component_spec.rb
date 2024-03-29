require 'spec_helper'

RSpec.describe(DsfrComponent::ModalComponent, type: :component) do
  subject! { render_inline(described_class.new(**args).with_content(content)) }

  context "with simple args" do
    let(:args) { { title: "Information importante", html_attributes: { id: "modal-1" } } }
    let(:content) { "Bonjour ceci est important" }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:dialog, with: { class: "fr-modal" }) do
        with_tag(:div, with: { class: "fr-modal__header" }) do
          with_tag(:button, with: { class: "fr-link--close fr-link", "aria-controls": "modal-1" }, text: "Fermer")
        end
        with_tag(:div, with: { class: "fr-modal__body" }) do
          with_tag(:h1, text: /Information importante/) do
            without_tag(:span)
          end
        end
        without_tag(:div, with: { class: "fr-modal__footer" })
      end
    end
  end

  context "with a primary button" do
    subject! do
      render_inline(described_class.new(title: "Information importante", html_attributes: { id: "modal-1" })) do |c|
        c.with_button { "<button class='fr-btn'>Valider</button>".html_safe }
        "<p>Bonjour ceci est important</p>".html_safe
      end
    end

    it "renders correctly" do
      expect(rendered_content).to have_tag(:dialog, with: { class: "fr-modal" }) do
        with_tag(:div, with: { class: "fr-modal__body" }) do
          with_tag(:h1, text: /Information importante/)
          with_tag(:p, text: /Bonjour ceci est important/)
        end
        with_tag(:div, with: { class: "fr-modal__footer" }) do
          without_tag(:p) # checking that the content does not appear in the footer
          with_tag(:button, class: "fr-btn", text: /Valider/)
        end
      end
    end
  end

  context "with two buttons" do
    subject! do
      render_inline(described_class.new(title: "Information importante", html_attributes: { id: "modal-1" })) do |c|
        c.with_button { "<button class='fr-btn'>Valider</button>".html_safe }
        c.with_button { "<button class='fr-btn fr-btn--secondary'>Annuler</button>".html_safe }
        "<p>Bonjour ceci est important</p>".html_safe
      end
    end

    it "renders correctly" do
      expect(rendered_content).to have_tag(:dialog, with: { class: "fr-modal" }) do
        with_tag(:div, with: { class: "fr-modal__body" }) do
          with_tag(:h1, text: /Information importante/)
          with_tag(:p, text: /Bonjour ceci est important/)
        end
        with_tag(:div, with: { class: "fr-modal__footer" }) do
          without_tag(:p)
          with_tag(:button, with: { class: "fr-btn--secondary" }, text: /Annuler/)
          with_tag(:button, with: { class: "fr-btn" }, text: /Valider/)
        end
      end
    end
  end

  context "without an id" do
    subject! do
      render_inline(described_class.new(title: "Information importante").with_content("Bonjour ceci est important"))
    end

    it "renders correctly without breaking" do
      expect(rendered_content).to have_tag(:dialog, with: { class: "fr-modal" }) do
        with_tag(:div, with: { class: "fr-modal__body" }, text: /Bonjour ceci est important/) do
          with_tag(:h1, text: /Information importante/)
        end
      end
    end
  end
end
