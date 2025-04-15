module Examples
  module SearchHelpers
    def search_default
      '= dsfr_search(url: "/components/search/")'
    end

    def search_custom
      '= dsfr_search(url: "/components/search/", size: :lg, name: :q, button_text: "Filtrer", method: :post, params: { sort: :url })'
    end
  end
end
