module DsfrComponent
  class BadgeComponent < DsfrComponent::Base
    STATUSES = %i[success error info warning new].freeze

    # @param status [BadgeComponent::STATUSES]
    def initialize(status: nil, html_attributes: {})
      validate_status!(status)

      @status = status

      super(html_attributes: html_attributes)
    end

    def call
      tag.div(**html_attributes) do
        content
      end
    end

  private

    attr_reader :status

    def default_attributes
      {
        class: class_names(
          'fr-badge',
          "fr-badge--#{status}" => status.present?
        )
      }
    end

    def validate_status!(status)
      raise(ArgumentError, "`status` should be one of #{STATUSES}") if status.present? && !STATUSES.include?(status)
    end
  end
end
