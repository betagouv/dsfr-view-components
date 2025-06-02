# frozen_string_literal: true

require 'spec_helper'

RSpec.describe(DsfrComponent::ProconnectButtonComponent, type: :component) do
  let(:component_css_class) { "fr-connect-group" }
  let(:target) { "#" }

  let(:kwargs) do
    {
      target: target
    }
  end

  it_behaves_like 'a component that accepts custom HTML attributes'
end
