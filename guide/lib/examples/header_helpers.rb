module Examples
  module HeaderHelpers
    def header_full
      <<~HEADER
        = dsfr_header logo_text: "Ministère du Travail", title: "Égapro", tagline: "Indice de parité professionelle" do |header|
          = header.with_operator_image title: "beta.gouv.fr", src: "/assets/images/logo-betagouvfr.svg", alt: "logo de beta.gouv.fr"
          = header.with_tool_link title: "Connexion", path: "#"
          = header.with_tool_link title: "Comment ça marche", path: "#"
          = header.with_tool_link title: "Contact", path: "#", html_attributes: { class: ["fr-btn", "fr-icon-mail-line"] }
          = header.with_direct_link_simple title: "Accueil", path: "#"
          = header.with_direct_link_simple title: "Ce service", path: "#"
          = header.with_direct_link_dropdown title: "L'équipe" do |dropdown|
            = dropdown.with_link title: "Beta Gouv", path: "#"
            = dropdown.with_link title: "DSFR", path: "#"
          = header.with_search do
            = form_with(url: "#") do |form|
              .fr-search-bar
                = form.label :query, "Rechercher", { class: 'fr-label' }
                = form.search_field :query, { class: 'fr-input' }
                %button.fr-btn{title: "Rechercher"} Rechercher
      HEADER
    end

    def header_with_operator_image_without_link
      <<~HEADER
        = dsfr_header logo_text: "Ministère du Travail" do |header|
          = header.with_operator_image href: nil, src: "/assets/images/logo-betagouvfr.svg", alt: "logo de beta.gouv.fr"
      HEADER
    end

    def header_with_operator_image_custom_link
      <<~HEADER
        = dsfr_header logo_text: "Ministère du Travail" do |header|
          = header.with_operator_image href: "https://beta.gouv.fr", title: "beta.gouv.fr - Accueil", src: "/assets/images/logo-betagouvfr.svg", alt: "logo de beta.gouv.fr"
      HEADER
    end

    def header_with_custom_tool_links
      <<~HEADER
        = dsfr_header logo_text: "Ministère du travail", href: "https://beta.gouv.fr", title: "Égapro" do |header|
          - if "l'utilisateur est connecté"
            = header.with_tool_link title: "Vos services (Marie Curie)", path: '#', html_attributes: { class: "fr-icon-account-line" }
            = header.with_custom_tool_link do
              = button_to "Déconnexion", '#', { method: :delete, class: "fr-btn fr-icon-logout-box-r-line", data: { turbo: "false" } }
      HEADER
    end
  end
end
