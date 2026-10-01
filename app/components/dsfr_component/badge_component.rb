module DsfrComponent
  class BadgeComponent < DsfrComponent::Base
    STATUSES = %i[success error info warning new].freeze
    SIZES = %i[md sm].freeze

    # @param status [BadgeComponent::STATUSES]
    # @param size [BadgeComponent::SIZES] taille du badge : `:md` (par défaut) ou `:sm` (optionnel)
    # @param has_icon [Boolean] `false` retire l'icône d'un badge système, nécessite un `status` (optionnel)
    # @param ellipsis [Boolean] tronque le libellé avec une ellipse s'il est trop long (optionnel)
    def initialize(status: nil, size: :md, has_icon: true, ellipsis: false, html_attributes: {})
      validate_status!(status)
      validate_size!(size)
      validate_has_icon!(has_icon, status)

      @status = status
      @size = size
      @has_icon = has_icon
      @ellipsis = ellipsis

      super(html_attributes: html_attributes)
    end

    def call
      tag.p(**html_attributes) do
        ellipsis ? tag.span(content, class: 'fr-ellipsis') : content
      end
    end

  private

    attr_reader :status, :size, :has_icon, :ellipsis

    def default_attributes
      {
        class: class_names(
          'fr-badge',
          "fr-badge--#{status}" => status.present?,
          "fr-badge--sm" => size == :sm,
          "fr-badge--no-icon" => !has_icon
        )
      }
    end

    def validate_status!(status)
      raise(ArgumentError, "`status` should be one of #{STATUSES}") if status.present? && !STATUSES.include?(status)
    end

    def validate_size!(size)
      raise(ArgumentError, "`size` should be one of #{SIZES} (received: `#{size}`)") if !SIZES.include?(size)
    end

    def validate_has_icon!(has_icon, status)
      raise(ArgumentError, "`has_icon: false` can only be used with a `status`") if !has_icon && status.blank?
    end
  end
end
