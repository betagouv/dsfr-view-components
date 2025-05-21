class DsfrComponent::AlertComponent < DsfrComponent::Base
  include DsfrComponent::Traits::HeaderSizeable

  TYPES = %i[error success info warning].freeze
  SIZES = %i[sm md].freeze

  # @param type [AlertComponent::TYPES]
  # @param title [String] le titre de l'alerte, sauf pour la taille `:sm`
  # @param size [AlertComponent::SIZES]
  # @param close_button [Boolean] contrôle l'affichage d'un bouton de fermeture
  # @param icon_name [String] un nom d'icône à afficher, seulement disponible pour le type par défaut
  # @param starting_header_level [Integer] Le niveau de titre
  # @note La taille `:md` requiert un titre mais le contenu est
  # optionel ; la taille `sm` requiert un contenu, mais pas de titre.
  def initialize(
    type: nil,
    title: nil,
    size: :md,
    close_button: false,
    icon_name: nil,
    starting_header_level: nil,
    html_attributes: {}
  )
    @title = title
    @type = type
    @size = size
    @close_button = close_button
    @icon_name = icon_name
    @starting_header_level = starting_header_level

    super(html_attributes: html_attributes)
  end

  def call
    check_main_content!
    check_icon_allowed!

    tag.div(**html_attributes) do
      safe_join([title_tag, content_tag, close_button_tag])
    end
  end

private

  attr_reader :title, :type, :size, :close_button, :icon_name

  def default_attributes
    { class: %w(fr-alert) + [icon_class, type_class, size_class].compact }
  end

  def default_type?
    type.nil?
  end

  def check_icon_allowed!
    raise ArgumentError, "a custom icon can only be used on default alert types" if icon_name && !default_type?
  end

  def main_content?
    case size
    when :sm
      content.present? && title.blank?
    when :md
      content.present? || title.present?
    else
      raise ArgumentError, "invalid alert size: '#{size}', supported sizes are #{SIZES.to_sentence}"
    end
  end

  def check_main_content!
    raise(
      ArgumentError,
      "You must provide a title for medium alerts, but you can't use it for small alerts (use content instead)"
    ) if not main_content?
  end

  def title_tag
    return nil if title.blank?

    tag.send(starting_header_tag, class: "fr-alert__title") { title }
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

  def valid_type?
    type.in?(TYPES)
  end

  def type_class
    return nil if type.blank?

    raise ArgumentError, "invalid alert type #{type}, supported types are #{TYPES.to_sentence}" unless valid_type?

    "fr-alert--#{type}"
  end

  def valid_size?
    size.in?(SIZES)
  end

  def size_class
    return nil if size == :md

    "fr-alert--#{size}"
  end
end
