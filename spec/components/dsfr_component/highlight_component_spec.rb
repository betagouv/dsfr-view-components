require 'spec_helper'

RSpec.describe(DsfrComponent::HighlightComponent, type: :component) do
  subject(:rendered_content) do
    if content.present?
      render_inline(component.with_content(content)).to_s
    else
      render_inline(component).to_s
    end
  end

  let(:text) { "foo" }
  let(:size) { :md }
  let(:content) { nil }
  let(:kwargs) { { text: text, size: size } }
  let(:component_css_class) { "fr-highlight" }
  let(:component) { described_class.new(**kwargs) }

  it "generates the right markup" do
    expect(rendered_content).to have_tag(:div, with: { class: "fr-highlight" }) do
      with_tag(:p, with: { class: "fr-text--md" }) do
        "foo"
      end
    end
  end

  context "when an unknown size is passed" do
    let(:size) { :xz }

    it_behaves_like 'a component that fails to render', /Size 'xz' is not allowed/
  end

  context "when a different size is specified" do
    let(:size) { :lg }

    it "produces the corresponding markup" do
      expect(rendered_content).to have_tag(:p, with: { class: "fr-text--lg" })
    end
  end

  context "when a block is provided" do
    let(:content) { "hello" }

    it "renders that content" do
      expect(rendered_content).to have_tag(:p, with: { class: "fr-text--md" }) do
        "hello"
      end
    end
  end

  context "without a block or a text" do
    let(:text) { nil }

    it_behaves_like 'a component that fails to render', /either a text param or some block/
  end

  it_behaves_like 'a component that accepts custom HTML attributes'
end
