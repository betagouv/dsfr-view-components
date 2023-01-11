module Examples
  module CommonOptionsHelpers
    def alert_with_classes
      <<~ALERT
        = dsfr_alert(type: :success, size: :sm, classes: "some-custom-class") do
          Texte alertant avec des classes
      ALERT
    end

    def alert_with_html_attributes
      <<~ALERT
        = dsfr_alert(type: :success, size: :sm,
          html_attributes: { lang: "fr-FR", data: { demo: true }, aria: { role: 'note' } }) do
          Texte alertant avec des attributs HTML
      ALERT
    end
  end
end
