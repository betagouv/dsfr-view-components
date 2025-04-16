class DsfrComponent::AlertComponent < DsfrComponent::Base
  TYPES = %i[error success info warning].freeze
  SIZES = %i[sm md].freeze

  # @param type [Symbol] alert type (and matching color) `:success`, `:info`, `:warning` ou `:error`
  # @param title [String] alert title. cannot be set in size `:sm`
  # @param size [Symbol] alert size : `:md` (default) or `:sm`
  # @param close_button [Boolean] display a close button to remove the alert
  # @note in size MD the title is required but the content is optional. In size SM there should be not title but the content is required
  def initialize(type: nil, title: nil, size: :md, close_button: false, icon_name: nil, html_attributes: {})
    @title = title
    @type = type
    @size = size
    @close_button = close_button
    @icon_name = icon_name

    super(html_attributes: html_attributes)
  end

  def call
    raise ArgumentError, "SM alerts cannot have titles but must have a content" if @size == :sm && (@title.present? || content.blank?)
    raise ArgumentError, "MD Alerts must have a title" if @size == :md && @title.blank?
    raise ArgumentError, "icon_name should be set only on default alert" if @type && @icon_name

    tag.div(**html_attributes) do
      safe_join([title_tag, content_tag, close_button_tag])
    end
  end

private

  attr_reader :title, :type, :size, :close_button, :icon_name

  def default_attributes
    { class: %w(fr-alert) + [icon_class, type_class, size_class].compact }
  end

  def title_tag
    return nil if title.blank?

    tag.h3(class: "fr-alert__title") { title }
  end

  def content_tag
    return nil if content.blank?

    tag.p { content }
  end

  def close_button_tag
    return nil unless close_button

    tag.button(
      class: "fr-btn--close fr-btn",
      title: "Masquer le message",
      onclick: "const alert = this.parentNode; alert.parentNode.removeChild(alert)"
    ) do
      "Masquer le message"
    end
  end

  def icon_class
    return nil if icon_name.blank?

    "fr-icon-#{icon_name}"
  end

  def type_class
    return nil if type.blank?
    fail(ArgumentError, type_error_message) unless valid_type?

    "fr-alert--#{type}"
  end

  def valid_type?
    type.in?(TYPES)
  end

  def type_error_message
    "invalid alert type #{type}, supported types are #{TYPES.to_sentence}"
  end

  def size_class
    return nil if size == :md

    fail(ArgumentError, size_error_message) unless valid_size?

    "fr-alert--#{size}"
  end

  def valid_size?
    size.in?(SIZES)
  end

  def size_error_message
    "invalid alert size #{size}, supported sizes are #{SIZES.to_sentence}"
  end
end
