module Examples
  module TooltipHelpers
    def tooltip_default
      <<~RAW
        = dsfr_tooltip(text: "Ceci est le texte de l’infobulle", label: "Information contextuelle")
      RAW
    end

    def tooltip_hover
      <<~RAW
        = dsfr_tooltip(text: "Ceci est le texte de l’infobulle", label: "Exemple", type: :hover)
      RAW
    end

    def tooltip_custom_trigger
      <<~RAW
        = dsfr_tooltip(text: "Ceci est le texte de l’infobulle", type: :hover) do |tooltip|
          = dsfr_button(label: "Information contextuelle", html_attributes: { type: "button", "aria-describedby": tooltip.id })
      RAW
    end
  end
end
