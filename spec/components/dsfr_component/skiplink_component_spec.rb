require 'spec_helper'

RSpec.describe(DsfrComponent::SkiplinkComponent, type: :component) do
  include ActionView::Helpers::UrlHelper

  subject! { render_inline(described_class.new(label: "Accès rapide", links: links)) }

  let(:links) do
    [
      dsfr_link_to("Contenu principal", "#main-content"),
      dsfr_link_to("Menu", "#menu"),
      dsfr_link_to("Pied de page", "#footer")
    ]
  end

  it "renders correctly" do
    expect(rendered_content).to have_tag(:div, with: { class: "fr-skiplinks" }) do
      with_tag(:nav, aria: { label: "Accès rapide" }, role: "navigation") do
        with_tag(:ul) do
          with_tag(:li) do
            with_tag(:a, with: { href: "#main-content" }, text: "Contenu principal")
          end
          with_tag(:li) do
            with_tag(:a, with: { href: "#menu" }, text: "Menu")
          end
          with_tag(:li) do
            with_tag(:a, with: { href: "#footer" }, text: "Pied de page")
          end
        end
      end
    end
  end
end
