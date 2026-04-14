require 'spec_helper'

RSpec.describe(DsfrComponent::TileComponent, type: :component) do
  subject! { render_inline(described_class.new(**args)) }

  context 'with a title, description and image' do
    let(:args) { { url: "/path", title: 'Titre', description: 'Description', image_src: '/img1.png' } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('div', with: { class: "fr-tile fr-enlarge-link" }) do
        with_tag('div', with: { class: 'fr-tile__body' }) do
          with_tag('div', with: { class: 'fr-tile__content' }) do
            with_tag("h4", with: { class: "fr-tile__title" }) do
              with_tag("a", with: { class: "fr-tile__link", href: "/path" })
            end
            with_tag("p", with: { class: "fr-tile__desc" }, text: /Description/)
          end
        end
        with_tag('div', with: { class: 'fr-tile__img' }) do
          with_tag("img", with: { src: "/img1.png", alt: "" })
        end
      end
    end
  end

  context 'with a title but no description and no image' do
    let(:args) { { url: "/path", title: 'Titre' } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('div', with: { class: "fr-tile fr-enlarge-link" }) do
        with_tag('div', with: { class: 'fr-tile__body' }) do
          with_tag('div', with: { class: 'fr-tile__content' }) do
            with_tag("h4", with: { class: "fr-tile__title" }) do
              with_tag("a", with: { class: "fr-tile__link", href: "/path" })
            end
            without_tag("p", with: { class: "fr-tile__desc" })
          end
        end
        without_tag('div', with: { class: 'fr-tile__img' })
      end
    end
  end

  context 'with an image alt text' do
    let(:args) { { url: "/path", title: 'Titre', image_src: "/img1.png", image_alt: "belle image" } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('div', with: { class: "fr-tile fr-enlarge-link" }) do
        with_tag('div', with: { class: 'fr-tile__img' }) do
          with_tag("img", with: { src: "/img1.png", alt: "belle image" })
        end
      end
    end
  end

  context 'with horizontal orientation' do
    let(:args) { { url: "/path", title: 'Titre', orientation: :horizontal } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('div', with: { class: "fr-tile fr-enlarge-link fr-tile--horizontal" })
    end
  end

  context 'with badges' do
    subject! do
      render_inline(described_class.new(url: "/path", title: 'Titre')) do |tile|
        tile.with_badge(status: :new) { "Nouveau" }
        tile.with_badge(status: :info) { "Info" }
      end
    end

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('div', with: { class: "fr-tile fr-enlarge-link" }) do
        with_tag('div', with: { class: 'fr-tile__content' }) do
          with_tag('div', with: { class: 'fr-tile__start' }) do
            with_tag('div', with: { class: 'fr-badge fr-badge--new' }, text: /Nouveau/)
            with_tag('div', with: { class: 'fr-badge fr-badge--info' }, text: /Info/)
          end
        end
      end
    end
  end

  context 'with more than 4 badges' do
    let(:args) { { url: "/path", title: 'Titre' } }

    specify 'raises an ArgumentError' do
      expect do
        render_inline(described_class.new(url: "/path", title: 'Titre')) do |tile|
          5.times { tile.with_badge(status: :info) { "Badge" } }
        end
      end.to raise_error(ArgumentError)
    end
  end

  context 'without badges' do
    let(:args) { { url: "/path", title: 'Titre' } }

    specify 'does not render fr-tile__start' do
      expect(rendered_content).not_to have_tag('div', with: { class: 'fr-tile__start' })
    end
  end

  context 'with specific title_level' do
    let(:args) { { url: "/path", title: 'Titre', heading_level: 2 } }

    specify 'renders correctly' do
      expect(rendered_content).to have_tag('div', with: { class: "fr-tile fr-enlarge-link" }) do
        with_tag('div', with: { class: 'fr-tile__body' }) do
          with_tag('div', with: { class: 'fr-tile__content' }) do
            with_tag("h2", with: { class: "fr-tile__title" })
          end
        end
      end
    end
  end
end
