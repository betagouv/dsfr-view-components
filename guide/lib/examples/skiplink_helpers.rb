module Examples
  module SkiplinkHelpers
    def skiplink_default
      <<~RAW
        - links = [dsfr_link_to("En-tête", "#header"), dsfr_link_to("Contenu", "#main-content"), dsfr_link_to("Pied de page", "#footer")]
        = dsfr_skiplink(label: "Accès rapide", links: links)
      RAW
    end
  end
end
