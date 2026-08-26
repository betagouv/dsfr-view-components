module DsfrComponent
  class SearchComponent < DsfrComponent::Base
    DEFAULT_LABEL_TEXT = 'Recherche'.freeze
    DEFAULT_BUTTON_TEXT = 'Rechercher'.freeze

    # @param url [String] form destination
    # @param name [String|Symbol] input name
    # @param size [Symbol] component size : `:md` (default) or `:sm`/`:lg`
    # @param label_text [String] Label text, default: "Recherche"
    # @param button_text [String] Button and placeholder text, default: "Rechercher"
    # @param value [String] Current input value (optional, defaults to request.params[name])
    # @param hidden_fields [Hash] Extra fields (optional)
    def initialize(url:, name: :search, size: :md, label_text: DEFAULT_LABEL_TEXT, button_text: DEFAULT_BUTTON_TEXT, **html_attributes)
      @url = url
      @name = name
      @label_text = label_text
      @button_text = button_text
      @size = size
      @value = html_attributes.delete(:value)
      @hidden_fields = html_attributes.delete(:hidden_fields) || {}
      @html_attributes = html_attributes

      validate_size!

      super(html_attributes: html_attributes)
    end

  private

    attr_reader :url, :size, :name, :label_text, :button_text, :hidden_fields, :html_attributes

    def flatten_hidden_fields(fields, prefix = nil)
      flattened = []
      fields.each do |key, value|
        field_name = prefix ? "#{prefix}[#{key}]" : key.to_s
        if value.is_a?(Hash)
          flattened.concat(flatten_hidden_fields(value, field_name))
        else
          flattened << [field_name, value]
        end
      end
      flattened
    end

    def id
      "#{name}_#{object_id}"
    end

    def value
      @value || (request && request.params[name])
    end

    def default_attributes
      classes = ['fr-search-bar']
      classes << "fr-search-bar--#{size}" unless size == :md
      { class: classes }
    end

    def validate_size!
      raise(ArgumentError, "`size` should be one of #{SIZES}") if size.present? && SIZES.exclude?(size)
    end
  end
end
