module DsfrComponent
  class StepperComponent < DsfrComponent::Base
    include DsfrComponent::Traits::HeaderSizeable

    # @param title [String] Titre de l’étape en cours
    # @param value [Integer] Numéro de l’étape en cours (commence à 1)
    # @param max [Integer] Nombre d’étapes total
    # @param next_title [String] Titre de l’étape suivante (sauf pour la dernière étape)
    # @param header_level [Integer] Niveau du titre
    def initialize(title:, value:, max:, next_title: nil, header_level: 2, html_attributes: {})
      @title = title
      @value = value
      @max = max
      @next_title = next_title
      self.header_level = header_level

      raise ArgumentError, "Les étapes doivent aller de 1 jusqu´à 8 au maximum" if @value < 1 || @value > @max || @max > 8

      super(html_attributes: html_attributes)
    end

  private

    attr_reader :title, :value, :max, :next_title

    def default_attributes
      { class: 'fr-stepper' }
    end
  end
end
