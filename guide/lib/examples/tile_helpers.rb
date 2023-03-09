module Examples
  module TileHelpers
    def tile_default
      <<~RAW
        = dsfr_tile(title: "Orgue de Fontainebleau",
                    url: "#",
                    image_src: "/assets/images/orgue.jpg",
                    description: "Magistral instrument de musique",
                    html_attributes: {style: "max-width: 20rem;"})
      RAW
    end

    def tile_without_description
      <<~RAW
        = dsfr_tile(title: "Orgue de Fontainebleau",
                    url: "#",
                    image_src: "/assets/images/orgue.jpg",
                    html_attributes: {style: "max-width: 20rem;"})
      RAW
    end

    def tile_without_image
      <<~RAW
        = dsfr_tile(title: "Orgue de Fontainebleau",
                    url: "#",
                    description: "Magistral instrument de musique",
                    html_attributes: {style: "max-width: 20rem;"})
      RAW
    end

    def tile_with_image_alt
      <<~RAW
        = dsfr_tile(title: "Orgue de Fontainebleau",
                    url: "#",
                    image_src: "/assets/images/orgue.jpg",
                    image_alt: "Orgue orange et bleu",
                    description: "Magistral instrument de musique",
                    html_attributes: {style: "max-width: 20rem;"})
      RAW
    end

    def tile_horizontal
      <<~RAW
        = dsfr_tile(title: "Orgue de Fontainebleau",
                    url: "#",
                    image_src: "/assets/images/orgue.jpg",
                    description: "Magistral instrument de musique",
                    orientation: :horizontal,
                    html_attributes: {style: "max-width: 30rem;"})
      RAW
    end

    def tile_heading_level
      <<~RAW
        = dsfr_tile(title: "Orgue de Fontainebleau",
                    url: "#",
                    image_src: "/assets/images/orgue.jpg",
                    image_alt: "Orgue orange et bleu",
                    heading_level: 2,
                    html_attributes: {style: "max-width: 20rem;"})
      RAW
    end
  end
end
