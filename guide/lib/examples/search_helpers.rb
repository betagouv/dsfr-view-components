module Examples
  module SearchHelpers
    def search_default
      '= dsfr_search(url: "/search")'
    end

    def search_custom
      '= dsfr_search(url: "/search", size: :lg, name: :q, button_text: "Filtrer", method: :post, params: { sort: :url })'
    end
  end
end
