require 'spec_helper'

RSpec.describe(DsfrComponent::AlertComponent, type: :component) do
  subject(:rendered_content) do
    if content.present?
      render_inline(component.with_content(content)).to_s
    else
      render_inline(component).to_s
    end
  end

  let(:type) { :error }
  let(:title) { "Titre de l'alerte" }
  let(:content) { "Contenu de l'alerte" }
  let(:size) { :md }
  let(:icon_name) { nil }
  let(:starting_header_level) { nil }

  let(:kwargs) do
    {
      type: type,
      title: title,
      size: size,
      icon_name: icon_name,
      starting_header_level: starting_header_level
    }
  end

  let(:component) { described_class.new(**kwargs) }
  let(:component_css_class) { "fr-alert" }

  context "with the error type" do
    let(:type) { :error }

    context "with content" do
      let(:content) { "Contenu de l'alerte" }

      it "renders both title and content" do
        expect(rendered_content).to have_tag('div', with: { class: "fr-alert fr-alert--error" }) do
          with_tag("h3", with: { class: "fr-alert__title" }, text: title)
          with_tag("p", text: content)
        end
      end
    end

    context "without content" do
      let(:content) { nil }

      it "renders only the title" do
        expect(rendered_content).to have_tag('div', with: { class: "fr-alert fr-alert--error" }) do
          with_tag("h3", with: { class: "fr-alert__title" }, text: title)
          without_tag("p")
        end
      end
    end
  end

  context "with a small size" do
    let(:size) { :sm }
    let(:title) { nil }

    it "adds the correct class" do
      expect(rendered_content).to have_tag('div', with: { class: "fr-alert fr-alert--sm" })
    end

    context "when a title is provided" do
      let(:title) { "some title" }

      it_behaves_like 'a component that fails to render', /can't use it for small/
    end

    context "when no content is provided" do
      let(:content) { nil }

      it_behaves_like 'a component that fails to render', /small alerts \(use content/
    end
  end

  context "with a medium size" do
    let(:size) { :md }

    context "without a title" do
      let(:title) { nil }

      it_behaves_like 'a component that fails to render', /must provide a title for medium/
    end
  end

  context "with type warning" do
    let(:type) { :warning }

    it "renders the appropriate class" do
      expect(rendered_content).to have_tag('div', with: { class: "fr-alert fr-alert--warning" })
    end
  end

  context "with an unknown type" do
    let(:type) { :unknown }

    it_behaves_like 'a component that fails to render', /invalid alert type/
  end

  context "with an invalid size" do
    let(:size) { :lg }

    it_behaves_like 'a component that fails to render', /invalid alert size/
  end

  context "when icon name present" do
    let(:icon_name) { "eye-fill" }
    let(:type) { nil }

    it "renders the icon" do
      expect(rendered_content).to have_tag('div', with: { class: "fr-alert fr-icon-eye-fill" })
    end

    context "with a defined alert type" do
      subject { nil }

      let(:type) { :success }

      it_behaves_like 'a component that fails to render', /can only be used on default/
    end
  end

  context "when a custom header level is passed" do
    let(:starting_header_level) { 6 }

    it "adjusts the markup" do
      expect(rendered_content).to have_tag('h6', with: { class: "fr-alert__title" })
    end
  end

  it_behaves_like 'a component that accepts custom HTML attributes'
end
