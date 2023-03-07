require 'spec_helper'

RSpec.describe(DsfrComponent::ButtonComponent, type: :component) do
  subject! { render_inline(described_class.new(**args)) }

  context "when simple button" do
    let(:args) { { label: "Valider" } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn" }, text: "Valider")
    end
  end

  context "when secondary button" do
    let(:args) { { label: "Valider", level: :secondary } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn fr-btn--secondary" }, text: "Valider")
    end
  end

  context "when tertiary button" do
    let(:args) { { label: "Valider", level: :tertiary } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn fr-btn--tertiary" }, text: "Valider")
    end
  end

  context "when disabled button" do
    let(:args) { { label: "Valider", html_attributes: { disabled: true } } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn", disabled: "disabled" }, text: "Valider")
    end
  end

  context "when icon default position left" do
    let(:args) { { label: "Valider", icon: "checkbox-circle-line" } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn fr-btn--icon-left fr-icon-checkbox-circle-line" }, text: "Valider")
    end
  end

  context "when icon explicit position left" do
    let(:args) { { label: "Valider", icon: "checkbox-circle-line", icon_position: :left } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn fr-btn--icon-left fr-icon-checkbox-circle-line" }, text: "Valider")
    end
  end

  context "when icon right" do
    let(:args) { { label: "Valider", icon: "checkbox-circle-line", icon_position: :right } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn fr-btn--icon-right fr-icon-checkbox-circle-line" }, text: "Valider")
    end
  end

  context "when icon-only button" do
    let(:args) { { icon: "checkbox-circle-line", html_attributes: { title: "Valider" } } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn fr-icon-checkbox-circle-line", title: "Valider" }, text: nil)
    end
  end

  context "when small button" do
    let(:args) { { label: "Valider", size: :sm } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn fr-btn--sm" }, text: "Valider")
    end
  end

  context "when large button" do
    let(:args) { { label: "Valider", size: :lg } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:button, with: { class: "fr-btn fr-btn--lg" }, text: "Valider")
    end
  end
end
