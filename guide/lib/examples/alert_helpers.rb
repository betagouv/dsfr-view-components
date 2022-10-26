module Examples
  module AlertHelpers
    def alert_success_with_content
      <<~ALERT
        = dsfr_alert(type: :success, title: "Bravo bien joué") do |alert|
          | Belle partie !
      ALERT
    end

    def alert_error_sm_without_content
      <<~ALERT
        = dsfr_alert(type: :error, size: :sm, title: "Erreur db 123")
      ALERT
    end

    def alert_with_close_button
      <<~ALERT
        = dsfr_alert(type: :success, title: "Bienvenue", close_button: true) do
          | Merci de vous être inscrit·e
      ALERT
    end
  end
end
