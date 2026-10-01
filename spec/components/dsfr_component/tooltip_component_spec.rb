require 'spec_helper'

RSpec.describe(DsfrComponent::TooltipComponent, type: :component) do
  subject! { render_inline(described_class.new(**args)) }

  let(:args) { { text: "Texte de l’infobulle", label: "Information contextuelle", html_attributes: { id: "tooltip-1" } } }

  context 'with a text and a label' do
    specify 'renders the tooltip' do
      expect(rendered_content).to \
        have_tag('span', with: { class: "fr-tooltip fr-placement", id: "tooltip-1", role: "tooltip" }, text: "Texte de l’infobulle")
    end

    specify 'renders the button' do
      expect(rendered_content).to \
        have_tag('button', with: { class: "fr-btn--tooltip fr-btn", type: "button", "aria-describedby": "tooltip-1" }, text: "Information contextuelle")
    end
  end

  context 'with the hover type' do
    let(:args) { { text: "Texte de l’infobulle", label: "Exemple", type: :hover, html_attributes: { id: "tooltip-1" } } }

    specify 'renders correctly' do
      expect(rendered_content).to \
        have_tag('a', with: { class: "fr-link", href: "#tooltip-1", "aria-describedby": "tooltip-1" }, text: "Exemple")
    end
  end

  context 'with the hover type and an href' do
    let(:args) { { text: "Texte de l’infobulle", label: "Exemple", type: :hover, href: "/path", html_attributes: { id: "tooltip-1" } } }

    specify 'renders correctly' do
      expect(rendered_content).to \
        have_tag('a', with: { class: "fr-link", href: "/path", "aria-describedby": "tooltip-1" }, text: "Exemple")
    end
  end

  context 'with the hover type and a block' do
    subject! do
      render_inline(described_class.new(text: "Texte de l’infobulle", type: :hover, html_attributes: { id: "tooltip-1" })) do |tooltip|
        "Déclencheur lié à #{tooltip.id}"
      end
    end

    specify 'renders correctly' do
      expect(rendered_content).to include("Déclencheur lié à tooltip-1")
    end
  end

  context 'without an id' do
    let(:args) { { text: "Texte de l’infobulle", label: "Information contextuelle" } }

    specify 'renders a generated id' do
      expect(rendered_content).to match(/<span class="fr-tooltip fr-placement" id="tooltip-\d+"/)
    end

    specify 'references the generated id from the trigger' do
      expect(rendered_content).to match(/aria-describedby="tooltip-\d+"/)
    end
  end

  context 'with an unknown type' do
    specify 'fails to render' do
      expect do
        render_inline(described_class.new(**args, type: :foobar))
      end.to raise_error(/`type` should be one of/)
    end
  end

  context 'with the click type and an href' do
    specify 'fails to render' do
      expect do
        render_inline(described_class.new(**args, href: "/path"))
      end.to raise_error(/href cannot be used together with/)
    end
  end

  context 'without a label nor a block' do
    specify 'fails to render' do
      expect do
        render_inline(described_class.new(text: "Texte de l’infobulle"))
      end.to raise_error(/`label` is required unless a block is given/)
    end
  end

  context 'with the click type and a block' do
    specify 'fails to render' do
      expect do
        render_inline(described_class.new(text: "Texte de l’infobulle")) { "Déclencheur" }
      end.to raise_error(/a block can only be used with the :hover type/)
    end
  end

  context 'with a label and a block' do
    specify 'fails to render' do
      expect do
        render_inline(described_class.new(**args, type: :hover)) { "Déclencheur" }
      end.to raise_error(/label and href cannot be used together with a block/)
    end
  end
end
