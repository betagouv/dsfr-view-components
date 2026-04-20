module DsfrComponent
  class CardComponent < DsfrComponent::Base
    SIZES = %i[sm lg].freeze
    HORIZONTAL_RATIOS = [true, :half, :tier].freeze

    renders_many :badges, "DsfrComponent::BadgeComponent"
    renders_one :footer

    def initialize(
      title:,
      url:,
      description: nil,
      image_src: nil,
      image_alt: "",
      heading_level: 3,
      size: nil,
      horizontal: false,
      start_detail: nil,
      start_detail_icon: nil,
      end_detail: nil,
      end_detail_icon: nil,
      enlarge_link: true,
      html_attributes: {}
    )
      raise ArgumentError, "`size` should be one of #{SIZES}" if size && SIZES.exclude?(size)
      raise ArgumentError, "`heading_level` should be one of #{HEADING_LEVELS}" if HEADING_LEVELS.exclude?(heading_level)
      raise ArgumentError, "`horizontal` should be one of #{[false] + HORIZONTAL_RATIOS}" if horizontal != false && HORIZONTAL_RATIOS.exclude?(horizontal)

      @title = title
      @url = url
      @description = description
      @image_src = image_src
      @image_alt = image_alt
      @heading_level = heading_level
      @size = size
      @horizontal = horizontal
      @start_detail = start_detail
      @start_detail_icon = start_detail_icon
      @end_detail = end_detail
      @end_detail_icon = end_detail_icon
      @enlarge_link = enlarge_link

      super(html_attributes: html_attributes)
    end

    # this guard is set at render-time because we cannot make the
    # footer-slot distinction in the constructor
    def before_render
      raise ArgumentError, "You cannot setup a footer on a card with `enlarge_link: true`" if footer? && enlarge_link
    end

  private

    attr_reader :title, :url, :description, :image_src, :image_alt,
                :heading_level, :size, :horizontal, :start_detail, :start_detail_icon,
                :end_detail, :end_detail_icon, :enlarge_link

    def default_attributes
      classes = ["fr-card"]
      classes << "fr-enlarge-link" if enlarge_link
      classes << "fr-card--horizontal" if horizontal
      classes << "fr-card--horizontal-#{horizontal}" if horizontal.is_a?(Symbol)
      classes << "fr-card--#{size}" if size
      { class: classes }
    end

    def title_tag(*args, **kwargs, &block)
      content_tag("h#{heading_level}", *args, **kwargs, &block)
    end

    def start_detail_classes
      ["fr-card__detail", start_detail_icon && "fr-icon-#{start_detail_icon}"].compact.join(" ")
    end

    def end_detail_classes
      ["fr-card__detail", end_detail_icon && "fr-icon-#{end_detail_icon}"].compact.join(" ")
    end
  end
end
