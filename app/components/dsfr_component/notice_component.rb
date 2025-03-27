module DsfrComponent
  class NoticeComponent < DsfrComponent::Base
    GENERIC_TYPES = %w[info waring alert].freeze
    WEATHER_TYPES = %w[weather-orange weather-red weather-purple].freeze
    ALERT_TYPES = %w[kidnapping cyberattack attack witness].freeze
    TYPES = GENERIC_TYPES + WEATHER_TYPES + ALERT_TYPES

    WEATHER_ICONS = %w[windy-fill thunderstorms-fill heavy-showers-fill flood-fill temp-cold-fill sun-fill avalanches-fill snowy-fill].freeze

    DESCRIPTION_TAGS = %i[p h1 h2 h3 h4 h5 h6].freeze

    # @param title [String] Titre du bandeau
    # @param description [String] Description du bandeau pour apporter du contexte (optionnel)
    # @param type [String] Type de bandeau (info, waring, alert, weather-orange, weather-red, weather-purple, kidnapping, cyberattack, attack, witness)
    # @param description_tag [Symbol] Balise HTML à utiliser pour la description (p, h1, h2, h3, h4, h5, h6)
    # @param icon [Boolean] Afficher ou non une icône, uniquement pour les bandeaux génériques
    # @param icon_name [String] Nom de l'icône à afficher
    # @param notice [Boolean] Ajout l’attribut role="notice" (si insertion du bandeau à la volée)
    # @param dismissible [Boolean] Ajouter un bouton de fermeture
    # @param dismiss_label [String] Libellé du bouton de fermeture (optionnel)
    # @param link_label [String] Libellé du lien (optionnel)
    # @param link_href [String] URL du lien (optionnel)
    # @param link_title [String] Titre du lien (optionnel)
    # @param link_blank [Boolean] Ouvrir le lien dans un nouvel onglet
    def initialize(title:, description:, type: "info", description_tag: :p, icon: true, icon_name: nil, notice: false, dismissible: false, dismiss_label: "Masquer le message", link_label: nil, link_href: nil, link_title: nil, link_blank: true,
                   classes: [], html_attributes: {})
      @title = title
      @description = description
      @type = type
      @description_tag = description_tag
      @icon_name = icon_name
      @notice = notice
      @dismissible = dismissible
      @dismiss_label = dismiss_label
      @link_label = link_label
      @link_href = link_href
      @link_title = link_title
      @link_blank = link_blank

      # D’après les règles du DSFR les types non génériques ont forcément une icône
      @icon = if GENERIC_TYPES.include?(type)
                icon
              else
                true
              end

      raise ArgumentError, "Invalid type: #{type}. Valid types: #{TYPES.join(', ')}" unless type_valid?

      raise ArgumentError, "Invalid description tag: #{description_tag}" unless DESCRIPTION_TAGS.include?(description_tag)

      if icon_name
        raise ArgumentError, "L’icône n’est pas personnalisable sur les bandeaux d’alertes" if ALERT_TYPES.include?(type)
        raise ArgumentError, "L’icône d’un bandeau de type météo doit être une icône météo (#{WEATHER_ICONS.join(', ')})" if WEATHER_TYPES.include?(type) && WEATHER_ICONS.exclude?(icon_name)
      end

      super(classes: classes, html_attributes: html_attributes)
    end

  private

    attr_reader :type, :title, :description, :description_tag, :icon, :icon_name, :notice, :dismissible, :link_label, :link_href, :link_title, :link_blank

    def notice_class
      "fr-notice--#{type}"
    end

    def type_valid?
      TYPES.include?(type)
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

      "fr-icon-#{icon_name}"
    end

    def default_attributes
      class_attr = "fr-notice #{notice_class}"
      class_attr += " fr-notice--no-icon" unless icon

      attr = { class: class_attr }
      attr[:role] = "notice" if notice

      attr
    end
  end
end
