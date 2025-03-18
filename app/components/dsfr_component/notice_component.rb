module DsfrComponent
  class NoticeComponent < DsfrComponent::Base
    GENERIC_TYPES = %w[info waring alert].freeze
    WEATHER_TYPES = %w[weather-orange weather-red weather-purple].freeze
    ALERT_TYPES = %w[kidnapping cyberattack attack witness].freeze
    TYPES = GENERIC_TYPES + WEATHER_TYPES + ALERT_TYPES

    WEATHER_ICONS = %w[windy-fill thunderstorms-fill heavy-showers-fill flood-fill temp-cold-fill sun-fill avalanches-fill snowy-fill].freeze

    MARKUPS = %i[p h1 h2 h3 h4 h5 h6].freeze

    # @param title [String] Titre du bandeau
    # @param description [String] Description du bandeau pour apporter du contexte (optionnel)
    # @param type [String] Type de bandeau (info, waring, alert, weather-orange, weather-red, weather-purple, kidnapping, cyberattack, attack, witness), par défaut "info"
    # @param markup [Symbol] Balise HTML à utiliser pour la description (p, h1, h2, h3, h4, h5, h6)
    # @param icon [Boolean] Afficher ou non une icône, uniquement pour les bandeaux génériques, par défaut true
    # @param icon_name [String] Nom de l'icône à afficher
    # @param notice [Boolean] Ajout l’attribut role="notice" (si insertion du bandeau à la volée), par défaut false
    # @param dismissible [Boolean] Ajouter un bouton de fermeture, par défaut false
    # @param dismiss_label [String] Libellé du bouton de fermeture (optionnel, par défaut « Masquer le message »)
    # @param link_label [String] Libellé du lien (optionnel)
    # @param link_href [String] URL du lien (optionnel)
    # @param link_title [String] Titre du lien (optionnel)
    # @param link_blank [Boolean] Ouvrir le lien dans un nouvel onglet, par défaut true
    def initialize(title:, description:, type: "info", markup: :p, icon: true, icon_name: nil, notice: false, dismissible: false, dismiss_label: "Masquer le message", link_label: nil, link_href: nil, link_title: nil, link_blank: true,
                   classes: [], html_attributes: {})
      @title = title
      @description = description
      @type = type
      @markup = markup
      @icon_name = icon_name
      @notice = notice
      @dismissible = dismissible
      @dismiss_label = dismiss_label
      @link_label = link_label
      @link_href = link_href
      @link_title = link_title
      @link_blank = link_blank

      @icon = if GENERIC_TYPES.include?(type)
                icon
              else
                true
              end

      super(classes: classes, html_attributes: html_attributes)
    end

  private

    attr_reader :type, :title, :description, :markup, :icon, :icon_name, :notice, :dismissible, :link_label, :link_href, :link_title, :link_blank

    def type_class
      raise ArgumentError, "Invalid type: #{type}. Valid types: #{TYPES.join(', ')}" unless type_valid?

      "fr-notice--#{type}"
    end

    def type_valid?
      TYPES.include?(type)
    end

    def markup_tag
      raise ArgumentError, "Invalid markup: #{markup}" unless markup_valid?

      markup
    end

    def markup_valid?
      MARKUPS.include?(markup)
    end

    def link_display?
      link_label.present? && link_href.present?
    end

    def link_tag
      return unless link_display?

      target = @link_blank ? "_blank" : "_self"

      link_to(link_label, link_href, title: link_title, target: target)
    end

    def icon_class
      return unless icon_name

      raise ArgumentError, "L’icône n’est pas personnalisable sur les bandeaux d’alertes" if ALERT_TYPES.include?(type)
      raise ArgumentError, "L’icône d’un bandeau de type météo doit être une icône météo (#{WEATHER_ICONS.join(', ')})" if WEATHER_TYPES.include?(type) && !WEATHER_ICONS.include?(icon_name)

      "fr-icon-#{icon_name}"
    end

    def default_attributes
      class_attr = "fr-notice #{type_class}"
      class_attr += " fr-notice--no-icon" unless icon

      attr = { class: class_attr }
      attr[:role] = "notice" if notice

      attr
    end
  end
end
