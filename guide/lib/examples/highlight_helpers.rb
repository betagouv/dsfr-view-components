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
  end
end
