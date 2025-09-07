module Helpers
  module ContentHelpers
    DSFR_COMPONENT_DOC_HREF = "https://www.systeme-de-design.gouv.fr/version-courante/fr/composants/".freeze

    def site_title
      "Composants Rails ViewComponent pour le Système de Design de lʼÉtat"
    end

  private

    def dsfr_component_doc_links(doc_id = nil)
      {
        "Voir #{@item[:title]} dans la documentation officielle" => "#{DSFR_COMPONENT_DOC_HREF}#{doc_id}"
      }
    end
  end
end
