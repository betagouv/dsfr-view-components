module Examples
  module AccordionHelpers
    def accordion_single
      <<~ACCORDION
        = dsfr_accordion_section(title: "Un") { tag.p("Premier contenu") }
      ACCORDION
    end

    def accordion_normal
      <<~ACCORDION
        = dsfr_accordion do |accordion|
          - accordion.with_section(title: "Un") { tag.p("Premier contenu") }
          - accordion.with_section(title: "Deux", id: "section-deux") { tag.p("Deuxième contenu") }
          - accordion.with_section(title: "Trois", expanded: true) { tag.p("Troisième contenu déplié") }
      ACCORDION
    end
  end
end
