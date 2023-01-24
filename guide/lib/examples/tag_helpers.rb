module Examples
  module TagHelpers
    def tag_default
      '= dsfr_tag(title: "bleu")'
    end

    def tag_icon
      '= dsfr_tag(title: "bleu", icon: "arrow-right-line")'
    end

    def tag_sm
      '= dsfr_tag(title: "bleu", size: :sm)'
    end

    def tag_clickable
      '= dsfr_tag(title: "bleu", url: "#")'
    end

    def tag_selected
      '= dsfr_tag(title: "bleu", selected: true)'
    end

    def tag_unselected
      '= dsfr_tag(title: "bleu", selected: false)'
    end

    def tag_dismissable
      <<~TAG
        = dsfr_tag(title: "bleu",
                   dismissable: true,
                   html_attributes: { onclick: "event.preventDefault(); this.parentNode.removeChild(this);" })
      TAG
    end
  end
end
