module DsfrComponent
  class CardComponent < DsfrComponent::Base
    SIZES = %i[sm lg].freeze
    HORIZONTAL_RATIOS = [true, :half, :tier].freeze

    renders_one :badge_group
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
      detail: nil,
      detail_icon: nil,
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
      @detail = detail
      @detail_icon = detail_icon
      @enlarge_link = enlarge_link

      super(html_attributes: html_attributes)
    end

  private

    attr_reader :title, :url, :description, :image_src, :image_alt,
                :heading_level, :size, :horizontal, :detail, :detail_icon, :enlarge_link

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

    def detail_classes
      ["fr-card__detail", detail_icon && "fr-icon-#{detail_icon}"].compact.join(" ")
    end
  end
end
