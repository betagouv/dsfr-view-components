# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DsfrComponent::Traits::HeaderSizeable do
  subject(:component) { test_component_class.new(**args) }

  let(:test_component_class) do
    Class.new do
      include DsfrComponent::Traits::HeaderSizeable

      def initialize(header_level: nil)
        self.header_level = header_level
      end
    end
  end

  describe '#header_level' do
    context 'when header_level is not provided' do
      let(:args) { {} }

      it 'returns the default header level' do
        expect(component.header_level).to eq(3)
      end
    end

    context 'when header_level is provided' do
      let(:args) { { header_level: 2 } }

      it 'returns the provided header level' do
        expect(component.header_level).to eq(2)
      end
    end

    context 'when header_level is off' do
      let(:args) { { header_level: 7 } }

      it 'returns the provided header level' do
        expect { test_component_class.new(header_level: 7) }
          .to raise_error(ArgumentError, /niveau du titre doit être compris entre/)
      end
    end
  end
end
