module DsfrComponent
  class SearchBarComponent < DsfrComponent::Base
    DEFAULT_LABEL_TEXT = 'Recherche'.freeze
    DEFAULT_BUTTON_TEXT = 'Rechercher'.freeze

    def initialize(url:, size: :md, name: :search, label: DEFAULT_LABEL_TEXT, button_text: DEFAULT_BUTTON_TEXT, classes: [], **html_attributes)
      @url = url
      @name = name
      @label = label
      @button_text = button_text
      @size = size
      @html_attributes = html_attributes

      validate_size!

      super(classes: classes, html_attributes: html_attributes)
    end

    def call
      form_with(url: url, method: :get, **html_attributes) do
        concat tag.label(label, name: name, class: 'fr-label')
        concat tag.input(type: :search, name: name, placeholder: button_text, class: 'fr-input')
        concat tag.button(type: :submit, name: nil, class: 'fr-btn') { button_text }
      end
    end

  private

    attr_reader :url, :size, :name, :label, :button_text, :html_attributes

    def default_attributes
      classes = ['fr-search-bar']
      classes << "fr-search-bar--#{size}" if size.present? && size != :md
      classes << html_attributes.delete(:class) if html_attributes.key?(:class)
      { class: classes }
    end

    def validate_size!
      raise(ArgumentError, "`size` should be one of #{SIZES}") if size.present? && SIZES.exclude?(size)
    end
  end
end
