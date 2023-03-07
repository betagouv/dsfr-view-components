module Examples
  module ButtonHelpers
    def button_levels
      <<~RAW
        = dsfr_button(label: "Valider")
        = dsfr_button(label: "Valider", level: :secondary)
        = dsfr_button(label: "Valider", level: :tertiary)
      RAW
    end

    def button_disabled
      '= dsfr_button(label: "Valider", html_attributes: { disabled: true })'
    end

    def button_icons
      <<~RAW
        = dsfr_button(label: "Valider", icon: "checkbox-circle-line")
        = dsfr_button(label: "Valider", icon: "checkbox-circle-line", icon_position: :right)
      RAW
    end

    def button_icon_only
      '= dsfr_button(icon: "checkbox-circle-line", html_attributes: { title: "Valider" })'
    end

    def button_sizes
      <<~RAW
        = dsfr_button(label: "Valider", size: :sm)
        = dsfr_button(label: "Valider", size: :lg)
      RAW
    end
  end
end
