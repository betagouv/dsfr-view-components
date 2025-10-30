module Examples
  module CalloutHelpers
    def callout_default
      <<~RAW
        = dsfr_callout(title: "Exemple de mise en avant") do |component|
          Cette information vient compléter le contenu principal
      RAW
    end

    def callout_no_icon
      <<~RAW
        = dsfr_callout(title: "Mise en avant sans icône", icon_name: :none) do |component|
          Tout ne s'illustre pas
      RAW
    end

    def callout_with_button
      <<~RAW
        = dsfr_callout(title: "Exemple de mise en avant") do |component|
          Cette information vient compléter le contenu principal.

          - component.with_action_zone { dsfr_button(label: "Valider") }
      RAW
    end

    def callout_with_different_header
      <<~RAW
        = dsfr_callout(title: "Exemple de mise en avant avec un titre en H2", header_level: 2) do |component|
          Cette information vient compléter le contenu principal
      RAW
    end
  end
end
