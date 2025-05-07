module Examples
  module HighlightHelpers
    def highlight_default
      <<~RAW
        = dsfr_highlight(text: "Ceci est une information mise en avant")
      RAW
    end

    def highlight_larger
      <<~RAW
        = dsfr_highlight(text: "Ceci est une information mise en avant, avec un texte plus large", size: :lg)
      RAW
    end

    def highlight_with_block
      <<~RAW
        = dsfr_highlight do
          Vous pouvez
          = link_to "contribuez à cette librairie", "https://github.com/betagouv/dsfr-view-components"
      RAW
    end
  end
end
