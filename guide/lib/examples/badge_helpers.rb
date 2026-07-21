module Examples
  module BadgeHelpers
    def badge_default
      <<~RAW
        = dsfr_badge(status: :new)     { "Dossier créé" }
        = dsfr_badge(status: :warning) { "Informations manquantes" }
        = dsfr_badge(status: :success) { "Dossier mis à jour" }
        = dsfr_badge(status: :error)   { "Erreur de traitement" }
        = dsfr_badge(status: :info)    { "Nouvelles informations" }
        = dsfr_badge { "Pas d'état" }
      RAW
    end

    def badge_sizes
      <<~RAW
        = dsfr_badge(status: :new, size: :sm)     { "Petit badge" }
        = dsfr_badge(status: :new) { "Badge normal" }
      RAW
    end
  end
end
