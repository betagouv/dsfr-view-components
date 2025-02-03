require 'spec_helper'

RSpec.describe DsfrComponent::CalloutComponent, type: :component do
  let(:title) { "Titre mise en avant" }
  let(:content) { "Contenu de la mise en avant" }

  it 'renders title and text' do
    render_inline(described_class.new(title: title).with_content(content))

    expect(rendered_content).to have_tag(:div, with: { class: "fr-callout" }) do
      with_tag('h3.fr-callout__title', text: title)
      with_tag('p.fr-callout__text', text: content)
    end
  end

  it "has a header level that can be customised" do
    render_inline(described_class.new(title: title, starting_header_level: 2).with_content(content))

    expect(rendered_content).to have_tag('h2')
  end

  it "has a default icon" do
    render_inline(described_class.new(title: title))

    expect(rendered_content).to have_tag('.fr-icon-information-line')
  end

  it "can use a different icon" do
    render_inline(described_class.new(title: title, icon_name: "foobar"))

    expect(rendered_content).to have_tag('.fr-icon-foobar')
  end

  context "when an action zone is provided" do
    it "renders it" do
      render_inline(
        described_class.new(title: "This is great").tap do |component|
          component.with_action_zone { "<button>Valider</button>".html_safe }
        end
      )

      expect(rendered_content).to have_tag(:button, text: "Valider")
    end
  end
end
