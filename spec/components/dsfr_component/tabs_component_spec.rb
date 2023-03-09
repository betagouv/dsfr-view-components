require 'spec_helper'

RSpec.describe(DsfrComponent::TabsComponent, type: :component) do
  context "with basic usage" do
    subject! do
      render_inline(described_class.new) do |tabs|
        render_inline(tabs.tab(title: "Onglet 1", active: true)) do
          "contenu premier onglet"
        end
        render_inline(tabs.tab(title: "Onglet 2")) do
          "contenu deuxième onglet"
        end
      end
    end

    it "renders correctly" do
      expect(rendered_content).to have_tag(:div, with: { class: "fr-tabs" }) do
        with_tag(:ul, with: { class: "fr-tabs__list" }) do
          with_tag \
            :button,
            with: { class: "fr-tabs__tab", role: "tab", "aria-selected": "true", "aria-controls": "tab-onglet-1-panel", id: "tab-onglet-1-nav" },
            text: /Onglet 1/
          with_tag \
            :button,
            with: { class: "fr-tabs__tab", role: "tab", "aria-selected": "false", "aria-controls": "tab-onglet-2-panel", id: "tab-onglet-2-nav" },
            text: /Onglet 2/
        end
        with_tag \
          :div,
          with: { class: "fr-tabs__panel fr-tabs__panel--selected", role: "tabpanel", id: "tab-onglet-1-panel", "aria-labelledby": "tab-onglet-1-nav" },
          text: /contenu premier onglet/
        with_tag \
          :div,
          with: { class: "fr-tabs__panel", role: "tabpanel", id: "tab-onglet-2-panel", "aria-labelledby": "tab-onglet-2-nav" },
          text: /contenu deuxième onglet/
      end
    end
  end

  context "with links instead of buttons" do
    subject! do
      render_inline(described_class.new) do |tabs|
        render_inline tabs.tab(title: "Onglet 1", path: "/onglet-1")
        render_inline tabs.tab(title: "Onglet 2", active: true) do
          "contenu deuxième onglet chargé"
        end
        render_inline tabs.tab(title: "Onglet 3", path: "/onglet-3")
      end
    end

    it "renders correctly" do
      expect(rendered_content).to have_tag(:div, with: { class: "fr-tabs" }) do
        with_tag(:ul, with: { class: "fr-tabs__list" }) do
          with_tag \
            :a,
            with: { href: "/onglet-1", "data-turbo-action": "advance", class: "fr-tabs__tab", role: "tab", "aria-selected": "false", "aria-controls": "tab-onglet-1-panel",
                    id: "tab-onglet-1-nav" },
            text: /Onglet 1/
          with_tag \
            :button,
            with: { class: "fr-tabs__tab", role: "tab", "aria-selected": "true", "aria-controls": "tab-onglet-2-panel",
                    id: "tab-onglet-2-nav" },
            text: /Onglet 2/
          with_tag \
            :a,
            with: { href: "/onglet-3", "data-turbo-action": "advance", class: "fr-tabs__tab", role: "tab", "aria-selected": "false", "aria-controls": "tab-onglet-3-panel",
                    id: "tab-onglet-3-nav" },
            text: /Onglet 3/
        end
        with_tag \
          :div,
          with: { class: "fr-tabs__panel", role: "tabpanel", id: "tab-onglet-1-panel", "aria-labelledby": "tab-onglet-1-nav" }
        with_tag \
          :div,
          with: { class: "fr-tabs__panel fr-tabs__panel--selected", role: "tabpanel", id: "tab-onglet-2-panel", "aria-labelledby": "tab-onglet-2-nav" }
        with_tag \
          :div,
          with: { class: "fr-tabs__panel", role: "tabpanel", id: "tab-onglet-3-panel", "aria-labelledby": "tab-onglet-3-nav" }
      end
    end
  end
end
