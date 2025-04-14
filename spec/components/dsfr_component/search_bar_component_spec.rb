require 'spec_helper'

RSpec.describe(DsfrComponent::SearchBarComponent, type: :component) do
  subject! { render_inline(described_class.new(**args)) }

  let(:url) { "/search" }
  let(:args) { { url: url } }

  context "without optional arguments" do
    it "renders the DSFR table structure" do
      expect(rendered_content).to have_tag(:form, with: { class: "fr-search-bar" }) do
        with_tag(:label, with: { class: "fr-label" }, text: described_class::DEFAULT_LABEL_TEXT)
        with_tag(:input, with: { class: "fr-input", placeholder: described_class::DEFAULT_BUTTON_TEXT })
        with_tag(:button, with: { class: "fr-btn", type: "submit" }, text: described_class::DEFAULT_BUTTON_TEXT)
      end
    end
  end

  describe "size option" do
    # rubocop:disable RSpec/MultipleExpectations
    %i[sm md lg].each do |size|
      context "when size is :#{size}" do
        let(:args) { { url: url, size: size } }

        it "renders with correct size class" do
          if size == :xl
            expect { rendered_content }.to raise_error(ArgumentError)
          elsif size == :md
            expect(rendered_content).not_to have_tag(:form, with: { class: "fr-search-bar--#{size}" })
          else
            expect(rendered_content).to have_tag(:form, with: { class: "fr-search-bar--#{size}" })
          end
        end
      end
    end
    # rubocop:enable RSpec/MultipleExpectations
  end

  describe "other options" do
    let(:args) { { url: url, name: "FOO", label: "BAR", button_text: "BAZ", class: "BUZ", data: { controller: :search } } }

    it "are applied" do
      expect(rendered_content).to have_tag(:form, with: { class: "BUZ", "data-controller": :search }) do
        with_tag(:label, text: "BAR")
        with_tag(:input, with: { name: "FOO", placeholder: "BAZ" })
        with_tag(:button, with: { type: :submit }, text: "BAZ")
      end
    end
  end
end
