module Examples
  module HeaderHelpers
    def header_simple
      '= dsfr_header logo_text: "Ministère du Travail", title: "Égapro"'
    end

    def header_logo_lines
      <<~HEADER
        = dsfr_header logo_text: "Ministère \\ndu Travail", title: "Égapro", classes: ["logo-pre-line"]

        :css
          .logo-pre-line .fr-logo {
            white-space: pre-line;
          }
      HEADER
    end

    def header_with_tool_links
      <<~HEADER
        = dsfr_header logo_text: "Ministère du Travail", title: "Égapro", tagline: "Indice de parité professionelle" do |header|
          - header.with_tool_link title: "Comment ça marche", path: "#comment-ca-marche"
          - header.with_tool_link title: "Contact", path: "#contact", classes: ["fr-icon-mail-line"]
      HEADER
    end

    def header_with_simple_direct_links
      <<~HEADER
        = dsfr_header logo_text: "Ministère du Travail", title: "Égapro", tagline: "Indice de parité professionelle" do |header|
          - header.with_direct_link_simple title: "Comment ça marche", path: "#comment-ca-marche"
          - header.with_direct_link_simple title: "Contact", path: "#contact"
      HEADER
    end

    def header_with_dropdown_direct_links
      <<~HEADER
        = dsfr_header logo_text: "Ministère du Travail", title: "Égapro", tagline: "Indice de parité professionelle" do |header|
          = header.with_direct_link_dropdown title: "Aide" do |dropdown|
            = dropdown.with_link title: "Comment ça marche", path: "#comment-ca-marche"
            = dropdown.with_link title: "Contact", path: "#contact"
          = header.with_direct_link_dropdown title: "Environnement" do |dropdown|
            = dropdown.with_link title: "Beta Gouv", path: "#beta-gouv"
            = dropdown.with_link title: "DSFR", path: "#dsfr"
      HEADER
    end

    def header_with_search
      <<~HEADER
        = dsfr_header logo_text: "Ministère du Travail", title: "Égapro", tagline: "Indice de parité professionelle" do |header|
          - header.with_search do
            %form
              .fr-search-bar(role="search")
                %label.fr-label(for="nom") Rechercher une entreprise
                %input.fr-input(type="text" name="nom" id="nom" placeholder="Nom de l’entreprise")
                %button.fr-btn(type="submit")
      HEADER
    end

    def header_full
      <<~HEADER
        = dsfr_header logo_text: "Ministère du Travail", title: "Égapro", tagline: "Indice de parité professionelle" do |header|
          - header.with_tool_link title: "Connexion", path: "#connexion"
          - header.with_tool_link title: "FAQ", path: "#FAQ", classes: ["fr-icon-question-line"]
          - header.with_direct_link_simple title: "Comment ça marche", path: "#comment-ca-marche"
          = header.with_direct_link_dropdown title: "Environnement" do |dropdown|
            = dropdown.with_link title: "Beta Gouv", path: "#beta-gouv"
            = dropdown.with_link title: "DSFR", path: "#dsfr"
          - header.with_direct_link_simple title: "Contact", path: "#contact"
          - header.with_search do
            %form
              .fr-search-bar(role="search")
                %label.fr-label(for="nom") Rechercher une entreprise
                %input.fr-input(type="text" name="nom" id="nom" placeholder="Nom de l’entreprise")
                %button.fr-btn(type="submit")
      HEADER
    end
  end
end
