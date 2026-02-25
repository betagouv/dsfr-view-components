require "spec_helper"

RSpec.describe(DsfrComponent::HeaderComponent, type: :component) do
  context "with only a logo and a title" do
    subject! { render_inline described_class.new(logo_text: "Ministère du Travail", title: "Égapro") }

    it "renders correctly" do
      expect(rendered_content).to have_tag("header", with: { class: "fr-header" }) do
        with_tag "div", with: { class: "fr-header__body" } do
          with_tag "div", with: { class: "fr-header__logo" } do
            with_tag "p", with: { class: "fr-logo" }, text: "Ministère du Travail"
          end
          without_tag "div", with: { class: "fr-header__navbar" }
          with_tag "div", with: { class: "fr-header__service" } do
            with_tag "a", with: { href: "/", title: "Accueil - Égapro" } do
              with_tag "p", with: { class: "fr-header__service-title" }, text: "Égapro"
            end
            without_tag "p", with: { class: "fr-header__service-tagline" }, text: "Indice de parité professionelle"
          end
          without_tag "div", with: { class: "fr-header__tools" }
        end
        without_tag "div", with: { class: "fr-header__menu" }
      end
    end
  end

  context "with a title and a custom href" do
    subject! { render_inline described_class.new(logo_text: "Ministère du Travail", title: "Égapro", href: "https://beta.gouv.fr") }

    it "renders the title link with the custom href" do
      expect(rendered_content).to have_tag("div", with: { class: "fr-header__service" }) do
        with_tag "a", with: { href: "https://beta.gouv.fr", title: "Accueil - Égapro" } do
          with_tag "p", with: { class: "fr-header__service-title" }, text: "Égapro"
        end
      end
    end
  end

  context "with a title and href nil" do
    subject! { render_inline described_class.new(logo_text: "Ministère du Travail", title: "Égapro", href: nil) }

    it "renders the title without a link" do
      expect(rendered_content).to have_tag("div", with: { class: "fr-header__service" }) do
        without_tag "a"
        with_tag "p", with: { class: "fr-header__service-title" }, text: "Égapro"
      end
    end
  end

  context "with tool links" do
    subject! do
      render_inline(
        described_class.new(
          logo_text: "Ministère du Travail",
          title: "Égapro",
          tagline: "Indice de parité professionelle"
        )
      ) do |component|
        component.with_tool_link title: "Comment ça marche", path: "#comment-ca-marche"
        component.with_tool_link title: "Contact", path: "#contact", html_attributes: { class: %w[fr-btn fr-icon-mail-line] }
      end
    end

    it "renders correctly" do
      expect(rendered_content).to have_tag("header", with: { class: "fr-header" }) do
        with_tag "div", with: { class: "fr-header__body" } do
          with_tag "div", with: { class: "fr-header__logo" } do
            with_tag "p", with: { class: "fr-logo" }, text: "Ministère du Travail"
          end
          with_tag "div", with: { class: "fr-header__navbar" } do
            without_tag "button", text: /Rechercher/
            with_tag "button", text: /Menu/
          end
          with_tag "div", with: { class: "fr-header__service" } do
            with_tag "p", with: { class: "fr-header__service-title" }, text: "Égapro"
            with_tag "p", with: { class: "fr-header__service-tagline" }, text: "Indice de parité professionelle"
          end
          with_tag "div", with: { class: "fr-header__tools" } do
            with_tag "div", with: { class: "fr-header__tools-links" } do
              with_tag "a", with: { class: "fr-btn", href: "#comment-ca-marche" }, text: "Comment ça marche"
              with_tag "a", with: { href: "#contact" }, text: "Contact"
            end
            without_tag "div", with: { class: "fr-header__search" }
          end
        end
      end
    end
  end

  context "with simple direct links" do
    subject! do
      render_inline(
        described_class.new(
          logo_text: "Ministère du Travail",
          title: "Égapro",
          tagline: "Indice de parité professionelle"
        )
      ) do |component|
        component.with_direct_link_simple title: "Comment ça marche", path: "#comment-ca-marche"
        component.with_direct_link_simple title: "Contact", path: "#contact"
      end
    end

    it "renders correctly" do
      expect(rendered_content).to have_tag("header", with: { class: "fr-header" }) do
        with_tag "div", with: { class: "fr-header__body" } do
          with_tag "div", with: { class: "fr-header__logo" } do
            with_tag "p", with: { class: "fr-logo" }, text: "Ministère du Travail"
          end
          with_tag "div", with: { class: "fr-header__navbar" } do
            without_tag "button", text: /Rechercher/
            with_tag "button", text: /Menu/
          end
          with_tag "div", with: { class: "fr-header__service" } do
            with_tag "p", with: { class: "fr-header__service-title" }, text: "Égapro"
            with_tag "p", with: { class: "fr-header__service-tagline" }, text: "Indice de parité professionelle"
          end
          without_tag "div", with: { class: "fr-header__tools" }
        end
        with_tag "div", with: { class: "fr-header__menu" } do
          with_tag "nav", with: { class: "fr-nav" } do
            with_tag "a", with: { class: "fr-nav__link", href: "#comment-ca-marche" }, text: "Comment ça marche"
            with_tag "a", with: { class: "fr-nav__link", href: "#contact" }, text: "Contact"
          end
          without_tag "div", with: { class: "fr-header__search" }
        end
      end
    end
  end

  context "with dropdown direct links" do
    subject! do
      render_inline(
        described_class.new(
          logo_text: "Ministère du Travail",
          title: "Égapro",
          tagline: "Indice de parité professionelle"
        )
      ) do |component|
        component.with_direct_link_dropdown title: "Aide" do |dropdown|
          dropdown.with_link title: "Comment ça marche", path: "#comment-ca-marche"
          dropdown.with_link title: "Contact", path: "#contact"
        end
        component.with_direct_link_dropdown title: "Environnement" do |dropdown|
          dropdown.with_link title: "Beta Gouv", path: "#beta-gouv"
          dropdown.with_link title: "DSFR", path: "#dsfr"
        end
      end
    end

    it "renders correctly" do
      expect(rendered_content).to have_tag("header", with: { class: "fr-header" }) do
        with_tag "div", with: { class: "fr-header__body" } do
          with_tag "div", with: { class: "fr-header__logo" } do
            with_tag "p", with: { class: "fr-logo" }, text: "Ministère du Travail"
          end
          with_tag "div", with: { class: "fr-header__navbar" } do
            without_tag "button", text: /Rechercher/
            with_tag "button", text: /Menu/
          end
          with_tag "div", with: { class: "fr-header__service" } do
            with_tag "p", with: { class: "fr-header__service-title" }, text: "Égapro"
            with_tag "p", with: { class: "fr-header__service-tagline" }, text: "Indice de parité professionelle"
          end
          without_tag "div", with: { class: "fr-header__tools" }
        end
        with_tag "div", with: { class: "fr-header__menu" } do
          with_tag "nav", with: { class: "fr-nav" } do
            with_tag "button", with: { class: "fr-nav__btn", "aria-controls": "menu-aide" }, text: "Aide"
            with_tag :div, with: { class: "fr-menu", id: "menu-aide" } do
              with_tag :a, with: { class: "fr-nav__link", href: "#comment-ca-marche" }, text: "Comment ça marche"
              with_tag :a, with: { class: "fr-nav__link", href: "#contact" }, text: "Contact"
            end
            with_tag "button", with: { class: "fr-nav__btn", "aria-controls": "menu-environnement" }, text: "Environnement"
            with_tag :div, with: { class: "fr-menu", id: "menu-environnement" } do
              with_tag :a, with: { class: "fr-nav__link", href: "#beta-gouv" }, text: "Beta Gouv"
              with_tag :a, with: { class: "fr-nav__link", href: "#dsfr" }, text: "DSFR"
            end
          end
          without_tag "div", with: { class: "fr-header__search" }
        end
      end
    end
  end

  context "with an operator image" do
    subject! do
      render_inline(described_class.new(logo_text: "Ministère du Travail")) do |component|
        component.with_operator_image src: "/logo.svg", alt: "logo de beta.gouv.fr", title: "beta.gouv.fr - Accueil"
      end
    end

    it "renders the operator image with a default link" do
      expect(rendered_content).to have_tag("div", with: { class: "fr-header__operator" }) do
        with_tag "a", with: { href: "/", title: "beta.gouv.fr - Accueil" } do
          with_tag "img", with: { class: "fr-responsive-img", src: "/logo.svg", alt: "logo de beta.gouv.fr" }
        end
      end
    end
  end

  context "with an operator image with custom href" do
    subject! do
      render_inline(described_class.new(logo_text: "Ministère du Travail")) do |component|
        component.with_operator_image href: "https://beta.gouv.fr", title: "beta.gouv.fr - Accueil", src: "/logo.svg", alt: "logo de beta.gouv.fr"
      end
    end

    it "renders the operator image with the custom link" do
      expect(rendered_content).to have_tag("div", with: { class: "fr-header__operator" }) do
        with_tag "a", with: { href: "https://beta.gouv.fr", title: "beta.gouv.fr - Accueil" } do
          with_tag "img", with: { class: "fr-responsive-img", src: "/logo.svg", alt: "logo de beta.gouv.fr" }
        end
      end
    end
  end

  context "with an operator image without link" do
    subject! do
      render_inline(described_class.new(logo_text: "Ministère du Travail")) do |component|
        component.with_operator_image href: nil, src: "/logo.svg", alt: "logo de beta.gouv.fr"
      end
    end

    it "renders the operator image without a link" do
      expect(rendered_content).to have_tag("div", with: { class: "fr-header__operator" }) do
        without_tag "a"
        with_tag "img", with: { class: "fr-responsive-img", src: "/logo.svg", alt: "logo de beta.gouv.fr" }
      end
    end
  end

  # rubocop:disable Rails/OutputSafety
  context "with search form" do
    subject! do
      render_inline(
        described_class.new(
          logo_text: "Ministère du Travail",
          title: "Égapro",
          tagline: "Indice de parité professionelle"
        )
      ) do |component|
        component.with_search do
          <<~HTML.html_safe
            <form>
              <div class="fr-search-bar" role="search">
                <label class="fr-label" for="nom">Rechercher une entreprise</label>
                <input placeholder="Rechercher une entreprise" autocomplete="off" class="fr-input" type="text" name="nom" id="nom">
                <button name="button" type="submit" class="fr-btn">Rechercher</button>
              </div>
            </form>
          HTML
        end
      end
    end

    it "renders correctly" do
      expect(rendered_content).to have_tag("header", with: { class: "fr-header" }) do
        with_tag "div", with: { class: "fr-header__body" } do
          with_tag "div", with: { class: "fr-header__logo" } do
            with_tag "p", with: { class: "fr-logo" }, text: "Ministère du Travail"
          end
          with_tag "div", with: { class: "fr-header__navbar" } do
            with_tag "button", text: /Rechercher/
            without_tag "button", text: /Menu/
          end
          with_tag "div", with: { class: "fr-header__tools" } do
            without_tag "div", with: { class: "fr-header__tools-links" }
            with_tag "div", with: { class: "fr-header__search" } do
              with_tag "div", with: { class: "fr-search-bar" } do
                with_tag "input", with: { placeholder: "Rechercher une entreprise" }
              end
            end
          end
        end
        without_tag "div", with: { class: "fr-header__menu" }
      end
    end
  end
  # rubocop:enable Rails/OutputSafety
end
