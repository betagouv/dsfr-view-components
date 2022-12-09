module Examples
  module CommonOptionsHelpers
    def alert_with_classes
      <<~ALERT
        = dsfr_alert(type: :success, size: :sm, classes: "govuk-!-font-weight-bold")
          | Texte alertant avec des classes
      ALERT
    end

    def alert_with_html_attributes
      <<~ALERT
        = dsfr_alert( \
          type: :success, size: :sm, \
          html_attributes: { lang: "fr-FR", data: { demo: true }, aria: { role: 'note' } } \
        )
          | Texte alertant avec des attributs HTML
      ALERT
    end
  end
end
