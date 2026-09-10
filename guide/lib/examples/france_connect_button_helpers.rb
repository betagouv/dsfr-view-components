module Examples
  module FranceConnectButtonHelpers
    def france_connect_button_default
      <<~RAW
        = dsfr_france_connect_button(target: "#")
      RAW
    end

    def france_connect_button_plus
      <<~RAW
        = dsfr_france_connect_button(target: "#", use_plus_version: true)
      RAW
    end

    def france_connect_button_override
      <<~RAW
        = dsfr_france_connect_button(target: "#", button_overrides: { class: "fr-foobar", method: :get })
      RAW
    end
  end
end
