module Examples
  module CardHelpers
    def card_default
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    image_src: "/assets/images/orgue.jpg",
                    description: "Magistral instrument de musique classé monument historique",
                    html_attributes: {style: "max-width: 25rem;"})
      RAW
    end

    def card_without_image
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    description: "Magistral instrument de musique classé monument historique",
                    html_attributes: {style: "max-width: 25rem;"})
      RAW
    end

    def card_with_detail
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    description: "Magistral instrument de musique classé monument historique",
                    detail: "Musique",
                    detail_icon: "music-2-line",
                    html_attributes: {style: "max-width: 25rem;"})
      RAW
    end

    def card_horizontal
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    image_src: "/assets/images/orgue.jpg",
                    description: "Magistral instrument de musique classé monument historique",
                    horizontal: true)
      RAW
    end

    def card_sizes
      <<~RAW
        = dsfr_card(title: "Petite carte",
                    url: "#",
                    description: "Version compacte du composant",
                    size: :sm,
                    html_attributes: {style: "max-width: 25rem;"})
      RAW
    end

    def card_with_footer
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    description: "Magistral instrument de musique classé monument historique",
                    enlarge_link: false,
                    html_attributes: {style: "max-width: 25rem;"}) do |card|
          - card.with_footer { dsfr_button(label: "En savoir plus") }
      RAW
    end

    def card_with_badge
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    image_src: "/assets/images/orgue.jpg",
                    description: "Magistral instrument de musique classé monument historique",
                    html_attributes: {style: "max-width: 25rem;"}) do |card|
          - card.with_badge_group do
            %ul.fr-badges-group
              %li.fr-badge.fr-badge--info Patrimoine
      RAW
    end
  end
end
