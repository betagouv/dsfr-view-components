module Examples
  module SideMenuHelpers
    def side_menu_default
      <<~RAW
        = dsfr_side_menu(title: "Test") do |component|
          = component.with_item(title: "Accueil", path: "#", current_page: true)
          = component.with_item(title: "Qui sommes-nous ?", path: "#")
      RAW
    end

    def side_menu_with_sub_items
      <<~RAW
        = dsfr_side_menu(title: "Test") do |component|
          = component.with_item(title: "Accueil", path: "#")
          = component.with_item(title: "Les composants", path: "#") do |item|
            = item.with_sub_item(title: "En-tête", path: "#")
            = item.with_sub_item(title: "Pied de page", path: "#")
          = component.with_item(title: "Documentation", path: "#", expanded: true) do |item|
            = item.with_sub_item(title: "Guide d'utilisation", path: "#", expanded: true) do |sub_item|
              = sub_item.with_sub_item(title: "Installation", path: "#")
            = item.with_sub_item(title: "API", path: "#")
      RAW
    end
  end
end
