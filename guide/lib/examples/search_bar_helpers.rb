module Examples
  module SearchBarHelpers
    def search_bar_default
      '= dsfr_search_bar(url: "/search")'
    end

    def search_bar_custom
      '= dsfr_search_bar(url: "/search", size: :lg, name: :q, button_text: "Filtrer", method: :post, params: { sort: :url })'
    end
  end
end
