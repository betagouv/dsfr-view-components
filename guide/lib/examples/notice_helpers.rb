module Examples
  module NoticeHelpers
    def notice_default
      <<~RAW
        = dsfr_notice(title: "Information", description: "Ceci est une info importante")
      RAW
    end

    def notice_dismissible
      <<~RAW
        = dsfr_notice(title: "Information", description: "Ceci est une info importante que vous pouvez masquer", dismissible: true)
      RAW
    end

    def notice_with_external_link
      <<~RAW
        = dsfr_notice(title: "Information", description: "Ceci est une info importante avec un super lien", link_label: "En savoir plus", link_href: "https://example.com", link_title: "En savoir plus - Nouvel onglet")
      RAW
    end

    def notice_with_internal_link
      <<~RAW
        = dsfr_notice(title: "Information", description: "Ceci est une info importante avec un super lien", link_label: "En savoir plus", link_href: "#", link_blank: false)
      RAW
    end
  end
end


