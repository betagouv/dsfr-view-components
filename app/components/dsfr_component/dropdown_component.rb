module DsfrComponent
  class DropdownComponent < DsfrComponent::Base
    # A dropdown component that displays content when a button is clicked.
    #
    # @param title [String] The title of the dropdown button
    # @param collapse_html_attributes [Hash] Additional HTML attributes for the collapse div
    # @param html_attributes [Hash] Additional HTML attributes for the button
    def initialize(title:, collapse_html_attributes: {}, html_attributes: {})
      @title = title
      @collapse_html_attributes = collapse_html_attributes
      @collapse_html_attributes[:id] ||= "dropdown-#{object_id}"

      super(html_attributes: html_attributes)
    end

    def call
      tag.button(title, **html_attributes) +
        tag.div(**collapse_attributes) do
          content
        end
    end

    attr_reader :title, :collapse_html_attributes

    def default_attributes
      { class: "fr-btn", "aria-expanded": "false", "aria-controls": dropdown_id }
    end

    def collapse_attributes
      collapse_class = collapse_html_attributes.delete(:class)
      { class: class_names("fr-collapse", collapse_class), id: dropdown_id }.merge(collapse_html_attributes)
    end

    def dropdown_id
      collapse_html_attributes[:id]
    end
  end
end
