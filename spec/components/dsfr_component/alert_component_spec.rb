require 'spec_helper'

RSpec.describe(DsfrComponent::AlertComponent, type: :component) do
  context "when type error with content" do
    subject! do
      render_inline(described_class.new(type: :error, title: "Erreur numéro 123")) do
        "La base de données est en carafe"
      end
    end

    it "renders both title and content" do
      expect(rendered_content).to have_tag('div', with: { class: "fr-alert fr-alert--error" }) do
        with_tag("h3", with: { class: "fr-alert__title" }, text: "Erreur numéro 123")
        with_tag("p", text: "La base de données est en carafe")
      end
    end
  end

  context "when type error without content" do
    subject! do
      render_inline(described_class.new(type: :error, title: "Erreur numéro 123"))
    end

    it "renders both title and content" do
      expect(rendered_content).to have_tag('div', with: { class: "fr-alert fr-alert--error" }) do
        with_tag("h3", with: { class: "fr-alert__title" }, text: "Erreur numéro 123")
        without_tag("p")
      end
    end
  end

  context "when type success without content with size sm" do
    subject! do
      render_inline(described_class.new(type: :success, title: "Erreur numéro 123", size: :sm))
    end

    it "renders both title and content" do
      expect(rendered_content).to have_tag('div', with: { class: "fr-alert fr-alert--success fr-alert--sm" }) do
        with_tag("h3", with: { class: "fr-alert__title" }, text: "Erreur numéro 123")
        without_tag("p")
      end
    end
  end

  context "when type warning with content and close button" do
    subject! do
      render_inline(described_class.new(type: :warning, title: "Erreur numéro 123", close_button: true)) do
        "fermez moi"
      end
    end

    it "renders both title and content" do
      expect(rendered_content).to have_tag('div', with: { class: "fr-alert fr-alert--warning" }) do
        with_tag("h3", with: { class: "fr-alert__title" }, text: "Erreur numéro 123")
        with_tag("p", text: "fermez moi")
        with_tag("button", with: { class: "fr-btn--close fr-btn" })
      end
    end
  end

  context "when erroneous type blague" do
    it "raises ArgumentError" do
      expect do
        render_inline(described_class.new(type: :blague, title: "Erreur numéro 123"))
      end.to raise_error(ArgumentError, /invalid alert type/)
    end
  end

  context "when erroneous size lg" do
    it "raises ArgumentError" do
      expect do
        render_inline(described_class.new(type: :success, title: "Erreur numéro 123", size: :lg))
      end.to raise_error(ArgumentError, /invalid alert size/)
    end
  end

  # it_behaves_like 'a component that accepts custom classes'
  # it_behaves_like 'a component that accepts custom HTML attributes'
end
