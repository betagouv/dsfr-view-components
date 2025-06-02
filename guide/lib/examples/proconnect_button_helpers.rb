module Examples
  module ProconnectButtonHelpers
    def proconnect_button_default
      <<~RAW
        = dsfr_proconnect_button(target: "#")
      RAW
    end

    def proconnect_button_override
      <<~RAW
        = dsfr_proconnect_button(target: "#", button_overrides: { class: "fr-foobar", method: :get })
      RAW
    end
  end
end
