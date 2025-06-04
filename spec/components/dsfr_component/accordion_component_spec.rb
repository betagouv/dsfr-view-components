require 'spec_helper'

RSpec.describe(DsfrComponent::AccordionComponent, type: :component) do
  context "two sections" do
    subject! do
      render_inline(DsfrComponent::AccordionComponent.new) do |component|
        component.with_section(title: "Un") { "Premier contenu" }
        component.with_section(title: "Deux") { "Deuxième contenu" }
      end
    end

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('div', with: { class: "fr-accordions-group" }) do
        with_tag('section', with: { class: 'fr-accordion' }) do
          with_tag("h3", with: { class: "fr-accordion__title" }) do
            with_tag("button", with: { type: "button", class: "fr-accordion__btn", "aria-expanded": "false" }, text: /Un/)
          end
          with_tag("div", with: { class: "fr-collapse" }, text: /Premier contenu/)
        end
        with_tag('section', with: { class: 'fr-accordion' }) do
          with_tag("h3", with: { class: "fr-accordion__title" }) do
            with_tag("button", with: { type: "button", class: "fr-accordion__btn", "aria-expanded": "false" }, text: /Deux/)
          end
          with_tag("div", with: { class: "fr-collapse" }, text: /Deuxième contenu/)
        end
      end
    end
  end

  context "with a specific section id" do
    subject! do
      render_inline(DsfrComponent::AccordionComponent.new) do |component|
        component.with_section(title: "Un", id: "test-un") { "Premier contenu" }
      end
    end

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('div', with: { class: "fr-accordions-group" }) do
        with_tag('section') do
          with_tag("h3") do
            with_tag("button", with: { "aria-controls": "test-un" })
          end
          with_tag("div", with: { class: "fr-collapse", id: "test-un" })
        end
      end
    end
  end

  context "when the default header level is overriden" do
    it "renders matching sections" do
      render_inline(DsfrComponent::AccordionComponent.new(starting_header_level: 2)) do |component|
        component.with_section(title: "Un", id: "test-un") { "Premier contenu" }
      end

      expect(rendered_content).to have_tag('h2')
    end
  end

  context "with an expanded section" do
    subject! do
      render_inline(DsfrComponent::AccordionComponent.new) do |component|
        component.with_section(title: "Un", expanded: true) { "Premier contenu" }
      end
    end

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('div', with: { class: "fr-accordions-group" }) do
        with_tag('section') do
          with_tag("h3") do
            with_tag("button", with: { "aria-expanded": "true" })
          end
          with_tag("div", with: { class: "fr-collapse fr-collapse--expanded" })
        end
      end
    end
  end
end
