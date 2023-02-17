require 'spec_helper'

RSpec.describe(DsfrComponent::TagComponent, type: :component) do
  subject! { render_inline(described_class.new(**args)) }

  context 'with a title' do
    let(:args) { { title: "Bleu" } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('p', with: { class: "fr-tag" }, text: "Bleu")
    end
  end

  context 'with a title and an icon' do
    let(:args) { { title: "Bleu", icon: "arrow-right-line" } }

    specify 'renders correctly' do
      expect(rendered_content).to \
        have_tag('p', with: { class: "fr-tag fr-fi-arrow-right-line fr-tag--icon-left" }, text: "Bleu")
    end
  end

  context 'with a title and sm size' do
    let(:args) { { title: "Bleu", size: :sm } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('p', with: { class: "fr-tag fr-tag--sm" }, text: "Bleu")
    end
  end

  context "with a title and an url" do
    let(:args) { { title: "Bleu", url: "/path" } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('a', with: { class: "fr-tag", href: "/path", target: "_self" }, text: "Bleu")
    end
  end

  context "with a title and selected true" do
    let(:args) { { title: "Bleu", selected: true } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('button', with: { class: "fr-tag", "aria-pressed": "true" }, text: "Bleu")
    end
  end

  context "with a title and selected false" do
    let(:args) { { title: "Bleu", selected: false } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('button', with: { class: "fr-tag", "aria-pressed": "false" }, text: "Bleu")
    end
  end

  context "with a title and dismissable" do
    let(:args) { { title: "Bleu", dismissable: true } }

    specify 'renders correctly' do
      expect(rendered_content).to \
        have_tag('button', with: { class: "fr-tag fr-tag--dismiss", "aria-label": "Retirer Bleu" }, text: "Bleu")
    end
  end
end
