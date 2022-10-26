module Examples
  module BreadcrumbsHelpers
    def breadcrumbs_normal
      <<~BREADCRUMBS
        = dsfr_breadcrumbs(breadcrumbs: breadcrumbs)
      BREADCRUMBS
    end

    def breadcrumbs_that_collapse_on_mobile
      <<~BREADCRUMBS
        = dsfr_breadcrumbs(breadcrumbs: breadcrumbs, collapse_on_mobile: true)

        p.govuk-inset-text If you make this page narrower the inner breadcrumbs will be hiddden.
      BREADCRUMBS
    end

    def breadcrumbs_from_an_array_of_links
      <<~BREADCRUMBS
        = dsfr_breadcrumbs(breadcrumbs: breadcrumbs)
      BREADCRUMBS
    end

    def breadcrumbs_data_three_levels
      <<~BREADCRUMBS
        { breadcrumbs: { "Home" => "/", "Level one page" => "/", "Level two page" => "/" } }
      BREADCRUMBS
    end

    def breadcrumbs_data_five_levels
      <<~BREADCRUMBS
        {
          breadcrumbs: {
            "Home" => "/",
            "Level one page" => "/",
            "Level two page" => "/",
            "Level three page" => "/",
            "Level four page" => "/",
          }
        }
      BREADCRUMBS
    end

    def breadcrumbs_array_of_links
      <<~BREADCRUMBS
        {
          breadcrumbs: [
            dsfr_breadcrumb_link_to("Home", "/"),
            dsfr_breadcrumb_link_to("Level one page", "/"),
            dsfr_breadcrumb_link_to("Level two page", "/")
          ]
        }
      BREADCRUMBS
    end
  end
end