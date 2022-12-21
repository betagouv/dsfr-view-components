module Helpers
  module TitleAnchorHelpers
    def anchor_id(caption)
      caption.parameterize
    end
  end

  module LinkHelpers
    def component_links
      {
        "Alerte" => "/components/alert",
        "Accordéon" => "/components/accordion"
      }
    end

    def design_system_link
      'https://www.systeme-de-design.gouv.fr/'
    end

    def github_link
      'https://github.com/betagouv/dsfr-view-components'
    end

    def rubygems_link
      # 'https://rubygems.org/gems/govuk-components'
    end

    def documentation_link
      # 'https://www.rubydoc.info/gems/govuk-components/'
    end

    def code_climate_report_link
      # 'https://codeclimate.com/github/DFE-Digital/govuk-components'
    end

    def viewcomponent_link
      'https://viewcomponent.org/'
    end

    def rails_docs_url_helper
      'https://edgeapi.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html'
    end

    def dsfr_icon_list_link
      'https://www.systeme-de-design.gouv.fr/elements-d-interface/fondamentaux-techniques/icones/'
    end

    def rails_docs_button_to
      'https://edgeapi.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-button_to'
    end
  end
end
