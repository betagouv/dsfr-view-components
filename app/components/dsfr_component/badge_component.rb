module DsfrComponent
  class BadgeComponent < DsfrComponent::Base
    STATUSES = %i[success error info warning new].freeze

    # @param status [BadgeComponent::STATUSES]
    def initialize(status:, classes: [], html_attributes: {})
      raise(ArgumentError, "`status` should be one of #{STATUSES}") unless STATUSES.include?(status)

      @status = status

      classes.push("fr-badge--#{@status}")

      super(classes: classes, html_attributes: html_attributes)
    end

    def call
      tag.div(**html_attributes) do
        content
      end
    end

  private

    attr_reader :status

    def default_attributes
      { class: 'fr-badge' }
    end
  end
end
