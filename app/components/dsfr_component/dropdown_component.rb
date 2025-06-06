module DsfrComponent
  class DropdownComponent < DsfrComponent::Base
    # @param title [String] Intitulé du bouton d'ouverture
    # @param collapse_html_attributes [Hash] Attributs HTML additionnels pour le bloc masqué (optionnels)
    # @param html_attributes [Hash] Attributs HTML additionnels pour le bouton (optionnels)
    def initialize(title:, collapse_html_attributes: {}, html_attributes: {})
      @title = title
      @collapse_html_attributes = collapse_html_attributes
      @html_attributes = html_attributes # Requis pour pouvoir adapter default_attributes

      super(html_attributes: html_attributes)
    end

    def call
      tag.button(title, **html_attributes) +
        tag.div(**collapse_attributes) do
          content
        end
    end

    attr_reader :title, :collapse_html_attributes, :html_attributes

    def default_attributes
      button_class = "fr-btn" unless html_attributes[:class].to_s.include?("fr-nav__btn")
      { class: button_class, "aria-expanded": "false", "aria-controls": dropdown_id }
    end

    def collapse_attributes
      collapse_class = collapse_html_attributes.delete(:class)
      { class: class_names("fr-collapse", collapse_class), id: dropdown_id }.merge(collapse_html_attributes)
    end

    def dropdown_id
      collapse_html_attributes[:id] ||= "dropdown-#{object_id}"
    end
  end
end
