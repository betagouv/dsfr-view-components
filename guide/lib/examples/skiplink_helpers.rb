module Examples
  module SkiplinkHelpers
    def skiplink_default
      <<~RAW
        - links = [dsfr_link_to("Aller au contenu", "#main-content")]
        = dsfr_skiplink(label: "Accès rapide", links: links)
      RAW
    end
  end
end
