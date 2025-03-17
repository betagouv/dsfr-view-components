require 'spec_helper'

RSpec.describe(DsfrComponent::NoticeComponent, type: :component) do
  let(:args) { { title: "Information", description: "Ceci est un message d'information" } }

  it "renders correctly" do
    render_inline(described_class.new(**args))

    expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--info" }) do
      with_tag(:div, with: { class: "fr-container" }) do
        with_tag(:div, with: { class: "fr-notice__body" }) do
          with_tag(:p) do
            with_tag(:span, with: { class: "fr-notice__title" }, text: "Information")
            with_tag(:span, with: { class: "fr-notice__desc" }, text: "Ceci est un message d'information")
          end
          without_tag(:button, with: { class: "fr-btn--close fr-btn", type: "button", title: "Fermer" })
        end
      end
    end
  end

  context "when type is alert" do
    let(:args) { { title: "Alerte", description: "Ceci est un message d'alerte", type: "alert" } }

    it "renders correctly" do
      render_inline(described_class.new(**args))

      expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--alert" }) do
        with_tag(:div, with: { class: "fr-container" }) do
          with_tag(:div, with: { class: "fr-notice__body" }) do
            with_tag(:p) do
              with_tag(:span, with: { class: "fr-notice__title" }, text: "Alerte")
              with_tag(:span, with: { class: "fr-notice__desc" }, text: "Ceci est un message d'alerte")
            end
          end
        end
      end
    end
  end

  context "when dismissible" do
    let(:args) { { title: "Information", description: "Ceci est un message d'information", dismissible: true, dismiss_label: "Fermer" } }

    it "renders correctly" do
      render_inline(described_class.new(**args))

      expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--info" }) do
        with_tag(:div, with: { class: "fr-container" }) do
          with_tag(:div, with: { class: "fr-notice__body" }) do
            with_tag(:button, with: { class: "fr-btn--close fr-btn", type: "button", title: "Fermer" }, text: "Fermer")
          end
        end
      end
    end
  end

  context "when link is present" do
    let(:args) { { title: "Information", description: "Ceci est un message d'information", link_label: "En savoir plus", link_href: "https://example.com", link_title: "En savoir plus - Nouvel onglet" } }

    it "renders correctly" do
      render_inline(described_class.new(**args))

      expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--info" }) do
        with_tag(:div, with: { class: "fr-container" }) do
          with_tag(:div, with: { class: "fr-notice__body" }) do
            with_tag(:p) do
              with_tag(:a, with: { href: "https://example.com", title: "En savoir plus - Nouvel onglet", target: "_blank" }, text: "En savoir plus")
            end
          end
        end
      end
    end

    context "when link_blank is false" do
      let(:args) { { title: "Information", description: "Ceci est un message d'information", link_label: "En savoir plus", link_href: "#", link_title: "En savoir plus", link_blank: false } }

      it "renders correctly" do
        render_inline(described_class.new(**args))

        expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--info" }) do
          with_tag(:div, with: { class: "fr-container" }) do
            with_tag(:div, with: { class: "fr-notice__body" }) do
              with_tag(:p) do
                with_tag(:a, with: { href: "#", title: "En savoir plus", target: "_self" }, text: "En savoir plus")
              end
            end
          end
        end
      end
    end

    context "when icon is false" do
      let(:args) { { title: "Information", description: "Ceci est un message d'information", icon: false } }

      it "renders correctly" do
        render_inline(described_class.new(**args))

        expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--info fr-notice--no-icon" })
      end
    end

    context "when icon is false and notice has weather type" do
      let(:args) { { title: "Information", description: "Ceci est un message d'information", type: "weather-red", icon: false } }

      it "renders correctly" do
        render_inline(described_class.new(**args))

        expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--weather-red" })
      end
    end

    context "when icon is false and notice has alert type" do
      let(:args) { { title: "Information", description: "Ceci est un message d'information", type: "attack", icon: false } }

      it "renders correctly" do
        render_inline(described_class.new(**args))

        expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--attack" })
      end
    end

    context "when icon_name is present" do
      let(:args) { { title: "Information", description: "Ceci est un message d'information", icon_name: "alarm-warning-fill" } }

      it "renders correctly" do
        render_inline(described_class.new(**args))

        expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--info" }) do
          with_tag(:div, with: { class: "fr-container" }) do
            with_tag(:div, with: { class: "fr-notice__body" }) do
              with_tag(:p) do
                with_tag(:span, with: { class: "fr-notice__title fr-icon-alarm-warning-fill" }, text: "Information")
              end
            end
          end
        end
      end
    end

    context "when notice has weather type and icon_name is invalid" do
      let(:args) { { title: "Information", description: "Ceci est un message d'information", type: "weather-red", icon_name: "alarm-warning-fill" } }

      it "raise" do
        expect do
          render_inline(described_class.new(**args))
        end.to raise_error(
          ArgumentError,
          "L’icône d’un bandeau de type météo doit être une icône météo (windy-fill, thunderstorms-fill, heavy-showers-fill, flood-fill, temp-cold-fill, sun-fill, avalanches-fill, snowy-fill)"
        )
      end
    end

    context "when notice has weather type and icon_name is valid" do
      let(:args) { { title: "Information", description: "Ceci est un message d'information", type: "weather-red", icon_name: "windy-fill" } }

      it "renders correctly" do
        render_inline(described_class.new(**args))

        expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--weather-red" }) do
          with_tag(:div, with: { class: "fr-container" }) do
            with_tag(:div, with: { class: "fr-notice__body" }) do
              with_tag(:p) do
                with_tag(:span, with: { class: "fr-notice__title fr-icon-windy-fill" }, text: "Information")
              end
            end
          end
        end
      end
    end

    context "when notice has alert type and icon_name is present" do
      let(:args) { { title: "Information", description: "Ceci est un message d'information", type: "attack", icon_name: "alarm-warning-fill" } }

      it "raise" do
        expect do
          render_inline(described_class.new(**args))
        end.to raise_error(ArgumentError, "L’icône n’est pas personnalisable sur les bandeaux d’alertes")
      end
    end

    context "when notice has notice role" do
      let(:args) { { title: "Information", description: "Ceci est un message d'information", notice: true } }

      it "renders correctly" do
        render_inline(described_class.new(**args))

        expect(rendered_content).to have_tag(:div, with: { class: "fr-notice fr-notice--info", role: "notice" })
      end
    end
  end
end
