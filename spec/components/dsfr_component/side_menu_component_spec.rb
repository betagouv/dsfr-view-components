require 'spec_helper'

RSpec.describe(DsfrComponent::SideMenuComponent, type: :component) do
  context "basic rendering" do
    subject! do
      render_inline(described_class.new(title: "Menu")) do |component|
        component.with_item(title: "Accueil", path: "/")
        component.with_item(title: "Contact", path: "/contact")
      end
    end

    it "renders the nav with correct attributes" do
      expect(rendered_content).to have_tag(:nav, with: { class: "fr-sidemenu", role: "navigation" })
    end

    it "renders the title" do
      expect(rendered_content).to have_tag("p", with: { class: "fr-sidemenu__title" }, text: "Menu")
    end

    it "renders the items" do
      expect(rendered_content).to have_tag("ul", with: { class: "fr-sidemenu__list" }) do
        with_tag("li", with: { class: "fr-sidemenu__item" }) do
          with_tag("a", with: { class: "fr-sidemenu__link", href: "/" }, text: "Accueil")
        end
        with_tag("li", with: { class: "fr-sidemenu__item" }) do
          with_tag("a", with: { class: "fr-sidemenu__link", href: "/contact" }, text: "Contact")
        end
      end
    end

    it "renders the collapse button with type attribute" do
      expect(rendered_content).to have_tag("button", with: { type: "button", class: "fr-sidemenu__btn" })
    end
  end

  context "with current_page" do
    subject! do
      render_inline(described_class.new(title: "Menu")) do |component|
        component.with_item(title: "Accueil", path: "/", current_page: true)
      end
    end

    it "renders the link with aria-current" do
      expect(rendered_content).to have_tag("a", with: { class: "fr-sidemenu__link", "aria-current": "page" })
    end
  end

  context "with sub_items (level 2)" do
    subject! do
      render_inline(described_class.new(title: "Menu")) do |component|
        component.with_item(title: "Section", path: "#") do |item|
          item.with_sub_item(title: "Page 1", path: "/page1")
          item.with_sub_item(title: "Page 2", path: "/page2")
        end
      end
    end

    it "renders the parent as a button" do
      expect(rendered_content).to have_tag("button", with: { type: "button", class: "fr-sidemenu__btn" }, text: /Section/)
    end

    it "renders nested list with sub_items" do
      expect(rendered_content).to have_tag("li", with: { class: "fr-sidemenu__item" }) do
        with_tag("div", with: { class: "fr-collapse" }) do
          with_tag("ul", with: { class: "fr-sidemenu__list" }) do
            with_tag("a", with: { href: "/page1" }, text: "Page 1")
            with_tag("a", with: { href: "/page2" }, text: "Page 2")
          end
        end
      end
    end
  end

  context "with 3 levels of nesting" do
    subject! do
      render_inline(described_class.new(title: "Menu")) do |component|
        component.with_item(title: "Niveau 1", path: "#") do |item|
          item.with_sub_item(title: "Niveau 2", path: "#") do |sub_item|
            sub_item.with_sub_item(title: "Niveau 3", path: "/page")
          end
        end
      end
    end

    it "renders all 3 levels correctly" do
      expect(rendered_content).to have_tag("ul", with: { class: "fr-sidemenu__list" }) do
        with_tag("button", text: /Niveau 1/)
        with_tag("div", with: { class: "fr-collapse" }) do
          with_tag("ul", with: { class: "fr-sidemenu__list" }) do
            with_tag("button", text: /Niveau 2/)
            with_tag("div", with: { class: "fr-collapse" }) do
              with_tag("ul", with: { class: "fr-sidemenu__list" }) do
                with_tag("a", text: "Niveau 3")
              end
            end
          end
        end
      end
    end
  end

  context "with more than 3 levels" do
    it "raises an ArgumentError" do
      expect {
        render_inline(described_class.new(title: "Menu")) do |component|
          component.with_item(title: "Niveau 1", path: "#") do |item|
            item.with_sub_item(title: "Niveau 2", path: "#") do |sub_item|
              sub_item.with_sub_item(title: "Niveau 3", path: "#") do |sub_sub_item|
                sub_sub_item.with_sub_item(title: "Niveau 4", path: "/page")
              end
            end
          end
        end
      }.to raise_error(ArgumentError, /ne supporte pas plus de 3 niveaux/)
    end
  end

  context "accessibility attributes" do
    subject! do
      render_inline(described_class.new(title: "Navigation"))
    end

    it "has role navigation on nav element" do
      expect(rendered_content).to have_tag(:nav, with: { role: "navigation" })
    end

    it "has aria-labelledby attribute on nav pointing to title" do
      expect(rendered_content).to match(/aria-labelledby="sidemenu-title-\d+"/)
    end

    it "has id on title element" do
      expect(rendered_content).to match(/<p class="fr-sidemenu__title" id="sidemenu-title-\d+"/)
    end

    it "has aria-controls on collapse button" do
      expect(rendered_content).to match(/aria-controls="sidemenu-collapse-\d+"/)
    end

    it "has id on collapse div" do
      expect(rendered_content).to match(/<div class="fr-collapse" id="sidemenu-collapse-\d+"/)
    end
  end
end
