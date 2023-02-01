module Helpers
  module ContentHelpers
    DSFR_COMPONENT_DOC_HREF = "https://www.systeme-de-design.gouv.fr/elements-d-interface/composants/".freeze

    def repository_name
      "DSFR-View-Components"
    end

    def site_title
      "Composants Rails ViewComponent pour le Système de Design de lʼÉtat"
    end

    def alert_info
      dsfr_component_doc_link("Alerte")
    end

    def accordion_info
      dsfr_component_doc_link("Accordéons", "accordeon")
    end

    def link_info
      dsfr_component_doc_link("Liens")
    end

    def tile_info
      dsfr_component_doc_link("Tuile")
    end

    def badge_info
      dsfr_component_doc_link("Badge")
    end

  private

    def dsfr_component_doc_link(name, id = nil)
      label = "#{name} sur la documentation du Système de Design de l'État"

      id ||= name.downcase

      { label => "#{DSFR_COMPONENT_DOC_HREF}/#{id}/" }
    end
  end
end
