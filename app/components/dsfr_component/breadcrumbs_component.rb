class DsfrComponent::BreadcrumbsComponent < DsfrComponent::Base
  renders_many :breadcrumbs, ->(label:, href: nil) do
    attributes = if href.nil?
                   { aria: { current: true } }
                 else
                   { href: href }
                 end

    content_tag(:a, class: 'fr-breadcrumb__link', **attributes) { label }
  end

private

  def default_attributes
    {
      class: 'fr-breadcrumb',
      aria: { label: 'vous êtes ici :' },
      role: "navigation"
    }
  end
end
