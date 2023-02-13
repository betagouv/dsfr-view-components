module Examples
  module TagHelpers
    def tags_not_interactive
      <<~TAG
        = dsfr_tag(title: "bleu")
        = dsfr_tag(title: "bleu", icon: "arrow-right-line")
        = dsfr_tag(title: "bleu", size: :sm)
      TAG
    end

    def tags_interactive
      <<~TAG
        = dsfr_tag(title: "bleu", url: "#")
        = dsfr_tag(title: "bleu", selected: false)
        = dsfr_tag(title: "bleu", selected: true)
        = dsfr_tag(title: "bleu",
                   dismissable: true,
                   html_attributes: { onclick: "event.preventDefault(); this.parentNode.removeChild(this);" })
      TAG
    end
  end
end
