require 'spec_helper'

class HelperComponentMapping
  attr_reader :helper_method, :klass, :args, :kwargs, :css_matcher, :block

  def initialize(helper_method:, klass:, args:, kwargs:, css_matcher:, block: nil)
    @helper_method = helper_method
    @klass         = klass
    @args          = args
    @kwargs        = kwargs
    @css_matcher   = css_matcher
    @block         = block
  end
end

RSpec.describe(DsfrComponentsHelper, type: 'helper') do
  include_context 'helpers'

  [
    {
      helper_method: :dsfr_accordion,
      klass: DsfrComponent::AccordionComponent,
      args: [],
      kwargs: {},
      css_matcher: %(.fr-accordions-group)
    }
  ]
    .map { |h| HelperComponentMapping.new(**h) }
    .each do |hcm|
      describe hcm.helper_method do
        subject(:component) do
          helper.send(hcm.helper_method, *hcm.args, **hcm.kwargs, &hcm.block)
        end

        specify %(should render the component #{hcm.klass}) do
          expect(component).to have_tag(hcm.css_matcher)
        end
      end
    end
end
