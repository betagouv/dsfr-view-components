require 'spec_helper'

RSpec.describe(DsfrComponent::StepperComponent, type: :component) do
  subject! { render_inline(described_class.new(**args)) }

  context "when 2nd step out of 5" do
    let(:args) { { title: "Choisissez votre ville", value: 2, max: 5, next_title: "Confirmez votre identité" } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:div, with: { class: "fr-stepper" }) do
        with_tag(:h2, with: { class: "fr-stepper__title" }, text: /Choisissez votre ville/) do
          with_tag(:span, with: { class: "fr-stepper__state" }, text: /Étape 2 sur 5/)
        end
        with_tag(:div, with: { class: "fr-stepper__steps", "data-fr-current-step": "2", "data-fr-steps": "5" })
        with_tag(:p, with: { class: "fr-stepper__details" }, text: /Confirmez votre identité/)
      end
    end
  end

  context "when 3rd step out of 3" do
    let(:args) { { title: "Choisissez votre ville", value: 3, max: 3 } }

    it "renders correctly" do
      expect(rendered_content).to have_tag(:div, with: { class: "fr-stepper" }) do
        with_tag(:h2, with: { class: "fr-stepper__title" }, text: /Choisissez votre ville/) do
          with_tag(:span, with: { class: "fr-stepper__state" }, text: /Étape 3 sur 3/)
        end
        with_tag(:div, with: { class: "fr-stepper__steps", "data-fr-current-step": "3", "data-fr-steps": "3" })
        without_tag(:p, with: { class: "fr-stepper__details" })
      end
    end
  end
end
