module DsfrComponent
  class ButtonComponent < DsfrComponent::Base
    SIZES = %i[sm md lg].freeze
    ICON_POSITIONS = %i[left right].freeze
    ICON_LEVELS = %i[primary secondary tertiary].freeze

    # @param label [String] Le label du bouton (optionnel si un icône présent)
    # @param icon [String] Le nom de l’icône à afficher (exemple `arrow-right-line`) (optionnel)
    # @param icon_position [String] Position de l’icône : :left (défaut) ou :right (optionnel)
    # @param title [String] Le titre du bouton permettant d’afficher une infobulle (optionnel)
    # @param level [String] Le niveau du bouton : :primary (défaut), :secondary ou :tertiary (optionnel)
    # @param size [String] La taille du bouton : :sm, :md (défaut), :lg (optionnel)
    def initialize(label: nil, title: nil, icon: nil, icon_position: :left, level: nil, size: nil, classes: [], html_attributes: {})
      @label = label
      @title = title
      @icon = icon
      @icon_position = icon_position
      @level = level
      @outline = outline
      @size = size

      validate_size
      validate_icon_position
      validate_level
      validate_label

      super(classes: classes, html_attributes: html_attributes)
    end

    def call
      tag.button(**html_attributes) { label }
    end

  private

    attr_reader :label, :icon, :icon_position, :level, :outline, :size

    def default_attributes
      classes = ["fr-btn"]
      classes << "fr-btn--#{level}" if level.present?
      classes << "fr-btn--#{size}" if size.present?
      classes << "fr-icon-#{icon}" if icon.present?
      classes << "fr-btn--icon-#{icon_position}" if icon.present? && label.present?
      { class: classes }
    end

    def validate_size
      raise(ArgumentError, "`size` should be one of #{SIZES}") if size.present? && SIZES.exclude?(size)
    end

    def validate_icon_position
      raise(ArgumentError, "`icon_position` should be one of #{ICON_POSITIONS}") if icon_position.present? && ICON_POSITIONS.exclude?(icon_position)
    end

    def validate_level
      raise(ArgumentError, "`level` should be one of #{ICON_LEVELS}") if level.present? && ICON_LEVELS.exclude?(level)
    end

    def validate_label
      raise(ArgumentError, "`label` is required unless an icon is specified") if label.blank? && icon.blank?
    end
  end
end
