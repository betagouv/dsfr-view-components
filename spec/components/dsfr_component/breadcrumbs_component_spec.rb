require 'spec_helper'

RSpec.describe(DsfrComponent::BreadcrumbsComponent, type: :component) do
  subject! do
    render_inline(described_class.new) do |b|
      b.with_breadcrumb(label: "Accueil", href: "/")
      b.with_breadcrumb(label: "Cette page")
    end
  end

  it "renders correctly" do
    expect(rendered_content).to have_tag(:nav, with: { class: "fr-breadcrumb" }) do
      with_tag(:ol, with: { class: "fr-breadcrumb__list" }) do
        with_tag \
          :a,
          with: { class: "fr-breadcrumb__link", href: '/' },
          text: "Accueil"
        with_tag \
          :a,
          with: { class: "fr-breadcrumb__link", "aria-current" => true },
          text: "Cette page"
      end
    end
  end
end
