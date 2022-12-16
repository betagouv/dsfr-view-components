module Examples
  module LinkHelpers
    def link_embed
      <<~LINK
        p
          ' Rendez-vous sur
          = link_to("cette page", "#")
          | pour en apprendre plus.

        p
          ' Rendez-vous sur
          = link_to("cet autre site web", "#", target: "_blank", rel: "noopener")
          | pour en apprendre toujours plus.
      LINK
    end

    def link_simple
      <<~LINK
        p= dsfr_link_to("Lien simple", "#")
        p= dsfr_link_to("Lien simple externe", "#", target: "_blank", rel: "noopener")
        p= dsfr_link_to("Lien simple avec icône à droite", "#", icon_right: "account-fill")
        p= dsfr_link_to("Lien taille petite", "#", size: "sm")
        p= dsfr_link_to("Lien taille large", "#", size: "lg")
      LINK
    end

    def all_links
      <<~LINK
        p
          ' Ceci est un
          = link_to "lien au fil du texte", "#"
          | . Ceci est un
          = link_to "lien externe au fil du texte", "#", { target: "_blank", rel: "noopener" }
          | .
        p= dsfr_link_to "Ceci est un lien hors-texte.", "#"
        p= dsfr_link_to "Ceci est un lien externe, hors-texte.", "#", { target: "_blank", rel: "noopener" }
      LINK
    end
  end
end
