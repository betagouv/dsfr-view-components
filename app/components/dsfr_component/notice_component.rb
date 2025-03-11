module DsfrComponent
  class NoticeComponent < DsfrComponent::Base
    TYPES = %i[info waring alert weather-orange weather-purple kidnapping cyberattack vigipirate witness].freeze
    MARKUPS = %i[p h1 h2 h3 h4 h5 h6].freeze

    # @param title [String] Titre du bandeau
    # @param description [String] Description du bandeau pour apporter du contexte (optionnel)
    # @param type [Symbol] Type de bandeau (info, waring, alert, weather-orange, weather-purple, kidnapping, cyberattack, vigipirate, witness), par défaut :info
    # @param markup [Symbol] Balise HTML à utiliser pour la description (p, h1, h2, h3, h4, h5, h6)
    # @param icon [Boolean] Afficher ou non une icône
    # @param icon_name [String] Nom de l'icône à afficher
    # @param notice [Boolean] Ajout l’attribut role="notice" (si insertion du bandeau à la volée), par défaut false
    # @param dismissible [Boolean] Ajouter un bouton de fermeture, par défaut false
    # @param link_label [String] Libellé du lien (optionnel)
    # @param link_href [String] URL du lien (optionnel)
    # @param link_title [String] Titre du lien (optionnel)
    # @param link_blank [Boolean] Ouvrir le lien dans un nouvel onglet, par défaut true
    def initialize(title:, description:, type: :info, markup: :p, icon: true, icon_name: nil, notice: false, dismissible: false, link_label: nil, link_href: nil, link_title: nil, link_blank: true,
                   classes: [], html_attributes: {})
      @title = title
      @description = description
      @type = type
      @markup = markup
      @icon = icon
      @icon_name = icon_name
      @notice = notice
      @dismissible = dismissible
      @link_label = link_label
      @link_href = link_href
      @link_title = link_title
      @link_blank = link_blank

      super(classes: classes, html_attributes: html_attributes)
    end

  private

    attr_reader :type, :title, :description, :markup, :icon, :icon_name, :notice, :dismissible, :link_label, :link_href, :link_title, :link_blank

    def type_class
      raise ArgumentError, "Invalid type: #{type}" unless type_valid?

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

      link_to(link_label, link_href, title: link_title, target: link_blank ? "_blank" : "_self")
    end

    def default_attributes
      { class: "fr-notice #{type_class}" }
    end
  end
end
