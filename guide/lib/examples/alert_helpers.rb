module Examples
  module AlertHelpers
    def alert_md_success_with_content
      <<~ALERT
        = dsfr_alert(type: :success, title: "Succès de votre inscription") do
          Votre inscription a bien été enregistrée
      ALERT
    end

    def alert_md_success_without_content
      <<~ALERT
        = dsfr_alert(type: :success, title: "Succès de votre inscription")
      ALERT
    end

    def alert_sm_error
      <<~ALERT
        = dsfr_alert(type: :error, size: :sm) do
          Une erreur est survenue pendant votre inscription, veuillez contacter votre administrateur
      ALERT
    end

    def alert_md_with_close_button
      <<~ALERT
        = dsfr_alert(type: :success, title: "Bienvenue", close_button: true) do
          Merci pour votre inscription
      ALERT
    end

    def alert_with_icon
      <<~ALERT
        = dsfr_alert(icon_name: "eye-fill", size: :sm) do
          Votre inscription est en cours de traitement
      ALERT
    end
  end
end
