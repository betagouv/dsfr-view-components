module Examples
  module BadgeHelpers
    def badge_default
      <<~RAW
        = dsfr_badge(status: :new)     { "Dossier créé" }
        = dsfr_badge(status: :warning) { "Informations manquantes" }
        = dsfr_badge(status: :success) { "Dossier mis à jour" }
        = dsfr_badge(status: :error)   { "Erreur de traitement" }
        = dsfr_badge(status: :info)    { "Nouvelles informations" }
      RAW
    end
  end
end
