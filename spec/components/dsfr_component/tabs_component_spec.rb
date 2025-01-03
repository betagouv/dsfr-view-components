require 'spec_helper'

RSpec.describe(DsfrComponent::TabsComponent, type: :component) do
  context "with basic usage" do
    subject! do
      render_inline(described_class.new) do |tabs|
        tabs.with_tab(title: "Onglet 1", active: true) do
          "contenu premier onglet"
        end
        tabs.with_tab(title: "Onglet 2") do
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

  context "with icons" do
    subject! do
      render_inline(described_class.new) do |tabs|
        tabs.with_tab(title: "Comment ça marche ?", icon: "info-line") do
          "Ça marche bien"
        end
        tabs.with_tab(title: "Contact", icon: "mail-line") do
          "Contactez-nous par email"
        end
        tabs.with_tab(title: "Support", active: true, icon: "settings-5-line") do
          "Support technique"
        end
      end
    end

    it "renders correctly" do
      expect(rendered_content).to have_tag(:div, with: { class: "fr-tabs" }) do
        with_tag(:ul, with: { class: "fr-tabs__list" }) do
          with_tag \
            :button,
            with: { class: "fr-tabs__tab fr-icon-info-line fr-tabs__tab--icon-left", role: "tab",
                    "aria-selected": "false", "aria-controls": "tab-comment-ca-marche-panel",
                    id: "tab-comment-ca-marche-nav" },
            text: /Comment ça marche/
          with_tag \
            :button,
            with: { class: "fr-tabs__tab fr-icon-mail-line fr-tabs__tab--icon-left", role: "tab",
                    "aria-selected": "false", "aria-controls": "tab-contact-panel",
                    id: "tab-contact-nav" },
            text: /Contact/
          with_tag \
            :button,
            with: { class: "fr-tabs__tab fr-icon-settings-5-line fr-tabs__tab--icon-left", role: "tab",
                    "aria-selected": "true", "aria-controls": "tab-support-panel",
                    id: "tab-support-nav" },
            text: /Support/
        end
      end
    end
  end

  context "with links instead of buttons" do
    subject! do
      render_inline(described_class.new) do |tabs|
        tabs.with_tab(title: "Onglet 1", path: "/onglet-1")
        tabs.with_tab(title: "Onglet 2", active: true) do
          "contenu deuxième onglet chargé"
        end
        tabs.with_tab(title: "Onglet 3", path: "/onglet-3")
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
