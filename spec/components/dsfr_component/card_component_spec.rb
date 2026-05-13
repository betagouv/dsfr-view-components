require 'spec_helper'

RSpec.describe(DsfrComponent::CardComponent, type: :component) do
  subject! { render_inline(component) }

  let(:title) { 'Titre de la carte' }
  let(:url) { '/chemin' }

  let(:kwargs) { { title: title, url: url } }
  let(:component) { described_class.new(**kwargs) }
  let(:component_css_class) { 'fr-card' }

  it 'renders the card with enlarge-link and a title link' do
    expect(rendered_content).to have_tag('div', with: { class: 'fr-card fr-enlarge-link' }) do
      with_tag('div', with: { class: 'fr-card__body' }) do
        with_tag('div', with: { class: 'fr-card__content' }) do
          with_tag('h3', with: { class: 'fr-card__title' }) do
            with_tag('a', with: { class: 'fr-card__link', href: '/chemin' }, text: 'Titre de la carte')
          end
        end
      end
    end
  end

  it 'renders no optional elements by default' do
    card_suffixes = %w[desc header end start footer]

    card_suffixes.each do |suffix|
      expect(rendered_content).not_to have_tag(".fr-card__#{suffix}")
    end
  end

  context 'with a description' do
    let(:kwargs) { { title: title, url: url, description: 'Description de la carte' } }

    it 'renders the description' do
      expect(rendered_content).to have_tag('p', with: { class: 'fr-card__desc' }, text: /Description de la carte/)
    end
  end

  context 'with an image' do
    let(:kwargs) { { title: title, url: url, image_src: '/img.png' } }

    it 'renders the image in a card header' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card__header' }) do
        with_tag('div', with: { class: 'fr-card__img' }) do
          with_tag('img', with: { src: '/img.png', alt: '', class: 'fr-responsive-img' })
        end
      end
    end
  end

  context 'with an image alt text' do
    let(:kwargs) { { title: title, url: url, image_src: '/img.png', image_alt: 'Photo descriptive' } }

    it 'sets the alt text' do
      expect(rendered_content).to have_tag('img', with: { alt: 'Photo descriptive' })
    end
  end

  context 'with a start detail' do
    let(:kwargs) { { title: title, url: url, start_detail: 'Catégorie' } }

    it 'renders the detail in the start section' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card__start' }) do
        with_tag('p', with: { class: 'fr-card__detail' }, text: /Catégorie/)
      end
    end
  end

  context 'with a start detail and an icon' do
    let(:kwargs) { { title: title, url: url, start_detail: 'Catégorie', start_detail_icon: 'calendar-line' } }

    it 'applies the icon class on the start detail element' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card__start' }) do
        with_tag('p', with: { class: 'fr-card__detail fr-icon-calendar-line' })
      end
    end
  end

  context 'with an end detail' do
    let(:kwargs) { { title: title, url: url, end_detail: 'Catégorie' } }

    it 'renders the detail in the end section' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card__end' }) do
        with_tag('p', with: { class: 'fr-card__detail' }, text: /Catégorie/)
      end
    end
  end

  context 'with an end detail and an icon' do
    let(:kwargs) { { title: title, url: url, end_detail: 'Catégorie', end_detail_icon: 'warning-fill' } }

    it 'applies the icon class on the end detail element' do
      expect(rendered_content).to have_tag('p', with: { class: 'fr-card__detail fr-icon-warning-fill' })
    end
  end

  context 'with both start and end details' do
    let(:kwargs) { { title: title, url: url, start_detail: 'Début', end_detail: 'Fin' } }

    it 'renders the start section' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card__start' }) do
        with_tag('p', with: { class: 'fr-card__detail' }, text: /Début/)
      end
    end

    it 'renders the end section' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card__end' }) do
        with_tag('p', with: { class: 'fr-card__detail' }, text: /Fin/)
      end
    end
  end

  context 'with size :sm' do
    let(:kwargs) { { title: title, url: url, size: :sm } }

    it 'applies the sm modifier' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card--sm' })
    end
  end

  context 'with size :lg' do
    let(:kwargs) { { title: title, url: url, size: :lg } }

    it 'applies the lg modifier' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card--lg' })
    end
  end

  context 'with horizontal: true' do
    let(:kwargs) { { title: title, url: url, horizontal: true } }

    it 'applies the horizontal modifier' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card--horizontal' })
    end
  end

  context 'with horizontal: :half' do
    let(:kwargs) { { title: title, url: url, horizontal: :half } }

    it 'applies horizontal and half modifiers' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card--horizontal fr-card--horizontal-half' })
    end
  end

  context 'with horizontal: :tier' do
    let(:kwargs) { { title: title, url: url, horizontal: :tier } }

    it 'applies horizontal and tier modifiers' do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-card--horizontal fr-card--horizontal-tier' })
    end
  end

  context 'with enlarge_link: false' do
    let(:kwargs) { { title: title, url: url, enlarge_link: false } }

    it 'omits fr-enlarge-link' do
      expect(rendered_content).not_to include 'fr-enlarge-link'
    end
  end

  context 'with a custom heading level' do
    let(:kwargs) { { title: title, url: url, heading_level: 2 } }

    it 'renders the title using the specified heading tag' do
      expect(rendered_content).to have_tag('h2', with: { class: 'fr-card__title' })
    end
  end

  context 'with an invalid size' do
    it 'raises an error' do
      expect { described_class.new(title: title, url: url, size: :xl) }.to raise_error(ArgumentError, /size/)
    end
  end

  context 'with an invalid heading level' do
    it 'raises an error' do
      expect { described_class.new(title: title, url: url, heading_level: 7) }.to raise_error(ArgumentError, /heading_level/)
    end
  end

  context 'with an invalid horizontal value' do
    it 'raises an error' do
      expect { described_class.new(title: title, url: url, horizontal: :diagonal) }.to raise_error(ArgumentError, /horizontal/)
    end
  end

  context 'with a footer slot' do
    it 'renders the footer when enlarge_link is false' do
      render_inline(described_class.new(**kwargs, enlarge_link: false).tap { |c| c.with_footer { '<button class="fr-btn">Action</button>'.html_safe } })

      expect(rendered_content).to have_tag('div', with: { class: 'fr-card__footer' }) do
        with_tag('button', with: { class: 'fr-btn' }, text: 'Action')
      end
    end

    it 'raises when used with enlarge_link' do
      expect do
        render_inline(described_class.new(**kwargs).tap { |c| c.with_footer { ''.html_safe } })
      end.to raise_error(ArgumentError, /footer/)
    end
  end

  context 'with badges' do
    it 'renders badges in the card header' do
      render_inline(described_class.new(**kwargs).tap do |c|
        c.with_badge(status: :info) { 'Patrimoine' }
        c.with_badge(status: :success) { 'Culture' }
      end)

      expect(rendered_content).to have_tag('div', with: { class: 'fr-card__header' }) do
        with_tag('ul', with: { class: 'fr-badges-group' }) do
          with_tag('li') { with_tag('div', with: { class: 'fr-badge fr-badge--info' }, text: 'Patrimoine') }
          with_tag('li') { with_tag('div', with: { class: 'fr-badge fr-badge--success' }, text: 'Culture') }
        end
      end
    end

    it 'renders the header even without an image' do
      render_inline(described_class.new(**kwargs).tap { |c| c.with_badge(status: :info) { 'Badge' } })

      expect(rendered_content).to have_tag('div', with: { class: 'fr-card__header' })
    end

    it 'does not render an image element when image_src is absent' do
      render_inline(described_class.new(**kwargs).tap { |c| c.with_badge(status: :info) { 'Badge' } })

      expect(rendered_content).not_to have_tag('div', with: { class: 'fr-card__img' })
    end
  end

  it_behaves_like 'a component that accepts custom HTML attributes'
end
