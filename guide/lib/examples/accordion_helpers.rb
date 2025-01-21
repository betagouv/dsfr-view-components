module Examples
  module AccordionHelpers
    def accordion_normal
      <<~ACCORDION
        = dsfr_accordion do |accordion|
          - accordion.with_section(title: "Un") { tag.p("Premier contenu") }
          - accordion.with_section(title: "Deux", id: "section-deux") { tag.p("Deuxième contenu") }
          - accordion.with_section(title: "Trois", expanded: true) { tag.p("Troisième contenu déplié") }
      ACCORDION
    end

    def accordion_custom_header_level
      <<~ACCORDION
        = dsfr_accordion(starting_header_level: 2) do |accordion|
          - accordion.with_section(title: "Un") { tag.p("Premier contenu") }
          - accordion.with_section(title: "Deux", id: "section-deux") { tag.p("Deuxième contenu") }
          - accordion.with_section(title: "Trois", expanded: true) { tag.p("Troisième contenu déplié") }
      ACCORDION
    end
  end
end
