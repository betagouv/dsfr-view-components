module DsfrComponent
  class BadgeComponent < DsfrComponent::Base
    STATUSES = %i[success error info warning new].freeze
    SIZES = %i[md sm].freeze

    # @param status [BadgeComponent::STATUSES]
    def initialize(status: nil, size: :md, html_attributes: {})
      validate_status!(status)
      validate_size!(size)

      @status = status
      @size = size

      super(html_attributes: html_attributes)
    end

    def call
      tag.div(**html_attributes) do
        content
      end
    end

  private

    attr_reader :status, :size

    def default_attributes
      {
        class: class_names(
          'fr-badge',
          "fr-badge--#{status}" => status.present?,
          "fr-badge--sm" => size == :sm
        )
      }
    end

    def validate_status!(status)
      raise(ArgumentError, "`status` should be one of #{STATUSES}") if status.present? && !STATUSES.include?(status)
    end

    def validate_size!(size)
      raise(ArgumentError, "`size` should be one of #{SIZES} (received: `#{status}`") if !SIZES.include?(size)
    end
  end
end
