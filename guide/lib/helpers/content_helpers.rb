module Helpers
  module ContentHelpers
    DSFR_COMPONENT_DOC_HREF = "https://www.systeme-de-design.gouv.fr/elements-d-interface/composants/".freeze

    def site_title
      "Composants Rails ViewComponent pour le Système de Design de lʼÉtat"
    end

    def component_helper_mapping
      {
        "DsfrComponent::AlertComponent" => "dsfr_alert",
        "DsfrComponent::AccordionComponent" => "dsfr_accordion",
        "DsfrComponent::TileComponent" => "dsfr_tile",
        "DsfrComponent::Badge" => "dsfr_badge"
      }
    end

  private

    def dsfr_component_doc_link(name, id = nil)
      label = "#{name} sur la documentation du Système de Design de l'État"

      id ||= name.downcase

      { label => "#{DSFR_COMPONENT_DOC_HREF}/#{id}/" }
    end
  end
end
