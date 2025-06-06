module Helpers
  module ContentHelpers
    DSFR_COMPONENT_DOC_HREF = "https://www.systeme-de-design.gouv.fr/composants-et-modeles/composants".freeze
    DSFR_COMPONENT_BETA_DOC_HREF = "https://www.systeme-de-design.gouv.fr/composants-et-modeles/composants-beta".freeze
    DSFR_COMPONENT_STORYBOOK_HREF = "https://storybook.systeme-de-design.gouv.fr".freeze

    def site_title
      "Composants Rails ViewComponent pour le Système de Design de lʼÉtat"
    end

  private

    def dsfr_component_doc_links(doc_id = nil, storybook_id = nil, beta: false)
      {
        "Voir #{@item[:title]} dans la documentation officielle" => "#{beta ? DSFR_COMPONENT_BETA_DOC_HREF : DSFR_COMPONENT_DOC_HREF}/#{doc_id}/",
        "Voir #{@item[:title]} sur le Storybook officiel" => "#{DSFR_COMPONENT_STORYBOOK_HREF}/?path=/docs/#{storybook_id}--docs"
      }
    end
  end
end
