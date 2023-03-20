module Examples
  module TabsHelpers
    def tabs_default
      <<~RAW
        = dsfr_tabs do |tabs|
          - tabs.tab title: "Onglet 1", active: true do
            %p Contenu de l’onglet 1
          - tabs.tab title: "Onglet 2" do
            %p Contenu de l’onglet 2
      RAW
    end

    def tabs_with_icons
      <<~RAW
        = dsfr_tabs do |tabs|
          - tabs.tab title: "Comment ça marche ?", icon: "info-fill" do
            %p Ça marche bien
          - tabs.tab title: "Contact", icon: "mail-line" do
            %p Contactez-nous par email
          - tabs.tab title: "Support", active: true, icon: "settings-5-line" do
            %p Support technique
      RAW
    end

    def tabs_with_links
      <<~RAW
        = dsfr_tabs do |tabs|
          - tabs.tab title: "Première page", path: "#onglet-1"
          - tabs.tab title: "Deuxième page", active: true do
            %p Contenu de l’onglet 2
          - tabs.tab title: "Troisième page", path: "#onglet-3"
      RAW
    end
  end
end
