module Examples
  module BreadcrumbsHelpers
    def breadcrumbs
      <<~BREADCRUMBS
        = dsfr_breadcrumbs do |b|
          = b.with_breadcrumb label: "Accueil", href: "#"
          = b.with_breadcrumb label: "Section 1", href: "#"
          = b.with_breadcrumb label: "Sous-section 2", href: "#"
          = b.with_breadcrumb label: "Cette page"
      BREADCRUMBS
    end
  end
end
