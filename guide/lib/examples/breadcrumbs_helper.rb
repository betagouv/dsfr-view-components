module Examples
  module BreadcrumbsHelpers
    def breadcrumbs
      <<~BREADCRUMBS
        = dsfr_breadcrumbs do |b|
          = b.breadcrumb label: "Accueil", href: "#"
          = b.breadcrumb label: "Section 1", href: "#"
          = b.breadcrumb label: "Sous-section 2", href: "#"
          = b.breadcrumb label: "Cette page"
      BREADCRUMBS
    end
  end
end
