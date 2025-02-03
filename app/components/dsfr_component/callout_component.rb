# frozen_string_literal: true

module DsfrComponent
  class CalloutComponent < DsfrComponent::Base
    def initialize(title: nil, classes: [], html_attributes: {})
      @title = title

      super(classes: classes, html_attributes: html_attributes)
    end

  private

    attr_reader :title

    def default_attributes
      { class: 'fr-callout fr-icon-information-line' }
    end
  end
end
