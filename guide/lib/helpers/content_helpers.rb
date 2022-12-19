module Helpers
  module ContentHelpers
    def repository_name
      "DSFR-View-Components"
    end

    def site_title
      "Composants Rails ViewComponent pour le Système de Design de lʼÉtat"
    end

    def alert_info
      {
        "Alertes - Alerts sur la documentation du Système de Design de lʼÉtat" => "https://www.systeme-de-design.gouv.fr/elements-d-interface/composants/alerte/"
      }
    end

    def accordion_info
      {
        "Accordéons sur la documentation du Système de Design de lʼÉtat" => "https://www.systeme-de-design.gouv.fr/elements-d-interface/composants/accordeon/"
      }
    end

    def link_info
      {
        "Les liens sur la documentation du Système de Design de lʼÉtat" => "https://www.systeme-de-design.gouv.fr/elements-d-interface/composants/liens/"
      }
    end

    def component_helper_mapping
      {
        "DsfrComponent::AlertComponent" => "dsfr_alert",
        "DsfrComponent::AccordionComponent" => "dsfr_accordion"
      }
    end
  end
end
