module DsfrComponent
  class TagComponent < DsfrComponent::Base
    SIZES = %i[sm md].freeze

    # @param title [String] tag title
    # @param icon [String] icon name (optional)
    # @param size [Symbol] tag size : `:md` (default) or `:sm` (optional)
    # @param url [String] for clickable tags only (optional)
    # @param selected [Boolean] adds a check, useful for filters list, cannot be used with `url` (optional)
    # @param dismissable [Boolean] adds a close icon on the right, cannot be used with `url` or `icon` (optional)
    def initialize(title:, icon: nil, size: nil, url: nil, selected: nil, dismissable: nil, classes: [], html_attributes: {})
      @title = title
      @icon = icon
      @size = size
      @url = url
      @selected = selected
      @dismissable = dismissable

      super(classes: classes, html_attributes: html_attributes)
    end

    def call
      validate_size && validate_selected && validate_dismissable
      tag.send(tag_name, **html_attributes) { title }
    end

  private

    attr_reader :title, :icon, :size, :url, :selected, :dismissable

    def validate_size
      raise(ArgumentError, "`size` should be one of #{SIZES}") if size.present? && SIZES.exclude?(size)
    end

    def validate_selected
      raise ArgumentError, "selected cannot be used together with an URL" if !selected.nil? && url.present?
    end

    def validate_dismissable
      raise ArgumentError, "dismissable cannot be used together with url or icon" if \
        dismissable && (url.present? || icon.present?)
    end

    def default_attributes
      attrs = { class: css_classes }
      attrs.merge!(href: url, target: "_self") if url.present?
      unless selected.nil? # meaningful when false
        aria_pressed = selected ? "true" : "false"
        attrs.merge!("aria-pressed": aria_pressed)
      end
      attrs.merge!("aria-label": "Retirer #{title}") if dismissable
      attrs
    end

    def css_classes
      classes = %w[fr-tag]
      classes += %W[fr-fi-#{icon} fr-tag--icon-left] if icon.present?
      classes << "fr-tag--sm" if size == :sm
      classes << "fr-tag--dismiss" if dismissable
      classes
    end

    def tag_name
      if url.present?
        :a
      elsif !selected.nil? || dismissable
        :button
      else
        :p
      end
    end
  end
end
