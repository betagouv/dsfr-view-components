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

    def card_with_start_detail
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    description: "Magistral instrument de musique classé monument historique",
                    start_detail: "Musique",
                    start_detail_icon: "music-2-line",
                    html_attributes: {style: "max-width: 25rem;"})
      RAW
    end

    def card_with_end_detail
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    description: "Magistral instrument de musique classé monument historique",
                    end_detail: "12 janvier 2024",
                    end_detail_icon: "calendar-line",
                    html_attributes: {style: "max-width: 25rem;"})
      RAW
    end

    def card_with_both_details
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    description: "Magistral instrument de musique classé monument historique",
                    start_detail: "Musique",
                    start_detail_icon: "music-2-line",
                    end_detail: "12 janvier 2024",
                    end_detail_icon: "calendar-line",
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

    def card_with_badges
      <<~RAW
        = dsfr_card(title: "Orgue de Fontainebleau",
                    url: "#",
                    image_src: "/assets/images/orgue.jpg",
                    description: "Magistral instrument de musique classé monument historique",
                    html_attributes: {style: "max-width: 25rem;"}) do |card|
          - card.with_badge(status: :info) { "Patrimoine" }
          - card.with_badge(status: :success) { "Culture" }
      RAW
    end
  end
end
