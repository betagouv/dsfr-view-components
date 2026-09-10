# frozen_string_literal: true

require 'spec_helper'

RSpec.describe(DsfrComponent::FranceConnectButtonComponent, type: :component) do
  let(:component_css_class) { "fr-connect-group" }
  let(:target) { "#" }

  let(:kwargs) do
    {
      target: target
    }
  end

  it_behaves_like 'a component that accepts custom HTML attributes'

  context "without options" do
    subject! { render_inline(described_class.new(target: target)) }

    it { expect(rendered_content).to have_tag("button", with: { class: "fr-connect" }) }
    it { expect(rendered_content).not_to have_tag("button", with: { class: "fr-connect--plus" }) }

    it "links to the FranceConnect info page" do
      expect(rendered_content).to have_tag("a", with: { href: "https://www.franceconnect.gouv.fr/" }, text: "Qu’est-ce que FranceConnect ?")
    end
  end

  context "with use_plus_version: true" do
    subject! { render_inline(described_class.new(target: target, use_plus_version: true)) }

    it { expect(rendered_content).to have_tag("button", with: { class: "fr-connect fr-connect--plus" }) }

    it "links to the FranceConnect+ info page" do
      expect(rendered_content).to have_tag("a", with: { href: "https://www.franceconnect.gouv.fr/franceconnect-plus/" }, text: "Qu’est-ce que FranceConnect+ ?")
    end
  end
end
