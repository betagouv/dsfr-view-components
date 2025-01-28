require 'spec_helper'

RSpec.describe(DsfrComponent::HighlightComponent, type: :component) do
  context "when an unknown size is passed" do
    it "raises an error" do
      expect { render_inline(described_class.new(text: "foo", size: :xz)) }.to raise_error ArgumentError
    end
  end

  it "generates the right markup" do
    render_inline(described_class.new(text: "foo"))

    expect(rendered_content).to have_tag(:div, with: { class: "fr-highlight" }) do
      with_tag(:p, with: { class: "fr-text--md" }) do
        "foo"
      end
    end
  end

  context "when a different size is specified" do
    it "produces the corresponding markup" do
      render_inline(described_class.new(text: "foo", size: :lg))

      expect(rendered_content).to have_tag(:p, with: { class: "fr-text--lg" })
    end
  end
end
