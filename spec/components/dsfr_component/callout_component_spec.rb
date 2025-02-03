require 'spec_helper'

RSpec.describe(DsfrComponent::CalloutComponent, type: :component) do
  subject! { render_inline(described_class.new(**args)) }

  context 'with a title' do
    let(:args) { { title: "Titre mise en avant" } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('h3', with: { class: "fr-callout__title" }, text: "Titre mise en avant")
    end
  end

  context "with content" do
    subject! do
      render_inline(described_class.new) do
        "La base de données est en carafe"
      end
    end

    it "renders both title and content" do
      expect(rendered_content).to have_tag('div', with: { class: "fr-callout fr-icon-information-line" }) do
        with_tag("p", with: { class: "fr-callout__text" }, text: "La base de données est en carafe")
      end
    end
  end
end
