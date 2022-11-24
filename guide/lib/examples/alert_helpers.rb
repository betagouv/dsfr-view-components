module Examples
  module AlertHelpers
    def alert_success_with_content
      <<~ALERT
        = dsfr_alert(type: :success, title: "Succès d'inscription") do |alert|
          | Votre inscription a bien été enregistrée
      ALERT
    end

    def alert_error_sm_without_content
      <<~ALERT
        = dsfr_alert( \
          type: :error, \
          size: :sm, \
          title: "Une erreur est survenue pendant votre inscription, veuillez contacter votre administrateur." \
        )
      ALERT
    end

    def alert_with_close_button
      <<~ALERT
        = dsfr_alert(type: :success, title: "Bienvenue", close_button: true) do
          | Merci pour votre inscription
      ALERT
    end
  end
end
