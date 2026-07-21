require 'spec_helper'

RSpec.describe(DsfrComponent::BadgeComponent, type: :component) do
  subject! { render_inline(described_class.new(**args).with_content(content)) }

  let(:content) { "Foobar" }
  let(:status) { :warning }
  let(:size) { :md }
  let(:args) { { status: status, size: size } }

  describe "validation" do
    it "renders correctly" do
      expect(rendered_content).to have_tag('div', with: { class: 'fr-badge' }, text: content)
    end

    context "with an unknown status" do
      it "fails to render" do
        expect do
          render_inline(described_class.new(status: :foobar))
        end.to raise_error(/`status` should be one of/)
      end
    end

    context "without a status" do
      let(:args) { {} }

      it "renders the plain badge" do
        expect(rendered_content).to have_tag 'div', with: { class: 'fr-badge' }
      end
    end

    context "with an unknown size" do
      it "fails to render" do
        expect do
          render_inline(described_class.new(size: :foobar))
        end.to raise_error(/`size` should be one of/)
      end
    end

    context "with a smaller size" do
      let(:size) { :sm }

      it "renders the correct class" do
        expect(rendered_content).to have_tag 'div', with: { class: 'fr-badge--sm' }
      end
    end
  end

  described_class.const_get(:STATUSES).each do |s|
    let(:status) { s }
    it "maps the '#{s}' status correctly" do
      expect(rendered_content).to have_tag 'div', with: { class: "fr-badge--#{status}" }
    end
  end
end
