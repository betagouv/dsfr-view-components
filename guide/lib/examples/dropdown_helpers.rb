module Examples
  module DropdownHelpers
    def dropdown_simple
      <<~DROPDOWN
        = dsfr_dropdown title: "Cliquez-moi" do
          %p Ce contenu apparaît lorsque vous cliquez sur le bouton.
      DROPDOWN
    end

    def dropdown_with_list
      <<~DROPDOWN
        = dsfr_dropdown title: "Menu" do
          %ul.fr-menu__list
            %li
              %a.fr-nav__link{href: "#"} Option 1
            %li
              %a.fr-nav__link{href: "#"} Option 2
            %li
              %a.fr-nav__link{href: "#"} Option 3
      DROPDOWN
    end

    def dropdown_with_form
      <<~DROPDOWN
        = dsfr_dropdown title: "Recherche" do
          %form
            .fr-input-group
              %label.fr-label{for: "search"} Rechercher
              %input.fr-input{type: "text", id: "search", name: "search", placeholder: "Rechercher..."}
              %button.fr-btn{type: "submit"} Rechercher
      DROPDOWN
    end

    def dropdown_with_custom_attributes
      <<~DROPDOWN
        = dsfr_dropdown title: "Menu personnalisé",
          html_attributes: { class: "fr-btn--secondary fr-icon-filter-line", "data-custom": "value" },
          collapse_html_attributes: { "data-controller": "foo" } do
          %ul.fr-menu__list
            %li
              %a.fr-nav__link{href: "#"} Option A
            %li
              %a.fr-nav__link{href: "#"} Option B
      DROPDOWN
    end
  end
end
