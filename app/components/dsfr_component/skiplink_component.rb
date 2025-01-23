module DsfrComponent
  class SkiplinkComponent < DsfrComponent::Base
    # @param label [String] FIXME: document
    # @param links [Array] FIXME: document
    def initialize(label:, links:, classes: [], html_attributes: {})
      @label = label
      @links = links

      super(classes: classes, html_attributes: html_attributes)
    end

  private

    attr_reader :label, :links

    def default_attributes
      { class: 'fr-skiplinks' }
    end
  end
end
