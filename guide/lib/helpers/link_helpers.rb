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
        "Accordéon" => "/components/accordion",
        # "Back link" => "/components/back-link",
        # "Breadcrumbs" => "/components/breadcrumbs",
        # "Cookie banner" => "/components/cookie-banner",
        # "Details" => "/components/details",
        # "Footer" => "/components/footer",
        # "Header" => "/components/header",
        # "Inset text" => "/components/inset-text",
        # "Notification banner" => "/components/notification-banner",
        # "Pagination" => "/components/pagination",
        # "Panel" => "/components/panel",
        # "Phase banner" => "/components/phase-banner",
        # "Start button" => "/components/start-button",
        # "Summary list" => "/components/summary-list",
        # "Table" => "/components/table",
        # "Tabs" => "/components/tabs",
        # "Tag" => "/components/tag",
        # "Warning text" => "/components/warning-text",
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

    def dfe_rails_boilerplate_link
      # 'https://github.com/DFE-Digital/govuk-rails-boilerplate'
    end

    def viewcomponent_link
      'https://viewcomponent.org/'
    end

    def rails_docs_url_helper
      'https://edgeapi.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html'
    end

    def rails_docs_button_to
      'https://edgeapi.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-button_to'
    end
  end
end
