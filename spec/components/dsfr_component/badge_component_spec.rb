require 'spec_helper'

RSpec.describe(DsfrComponent::BadgeComponent, type: :component) do
  subject! { render_inline(described_class.new(**args).with_content(content)) }

  let(:content) { "Foobar" }
  let(:status) { :warning }
  let(:args) { { status: status } }

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
  end

  described_class.const_get(:STATUSES).each do |s|
    let(:status) { s }
    it "maps the '#{s}' status correctly" do
      expect(rendered_content).to have_tag 'div', with: { class: "fr-badge--#{status}" }
    end
  end
end
