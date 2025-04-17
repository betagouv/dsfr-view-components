require 'spec_helper'

RSpec.describe(DsfrComponent::DropdownComponent, type: :component) do
  subject(:rendered_content) { render_inline(component).to_s }

  let(:title) { "Services" }
  let(:kwargs) { { title: title } }
  let(:component) { described_class.new(**kwargs).with_content("Content") }
  let(:component_css_class) { "fr-btn" }

  context "without parameters" do
    it "renders the dropdown" do
      expect(rendered_content).to have_tag("button", with: {
                                             class: "fr-btn",
                                             "aria-expanded": "false",
                                             "aria-controls": component.dropdown_id
                                           }, text: title)
    end

    it "renders the dropdown collapse" do
      expect(rendered_content).to have_tag('div', with: { class: "fr-collapse" }, text: "Content")
    end
  end

  context "with custom html attributes for button" do
    let(:custom_attributes) { { "data-custom": "value", "aria-label": "Dropdown menu" } }
    let(:kwargs) { { title: title, html_attributes: custom_attributes } }

    it "renders the button with custom attributes" do
      expect(rendered_content).to have_tag("button", with: custom_attributes.merge(class: "fr-btn"))
    end
  end

  context "with custom html attributes for collapse div" do
    let(:collapse_attributes) { { class: "fr-collapse fr-menu", "data-collapse": "true" } }
    let(:kwargs) { { title: title, collapse_html_attributes: collapse_attributes } }

    it "renders the collapse div with custom attributes" do
      expect(rendered_content).to have_tag("div", with: { class: "fr-collapse fr-menu", "data-collapse": "true" })
    end
  end

  it_behaves_like "a component that accepts custom HTML attributes"
end
