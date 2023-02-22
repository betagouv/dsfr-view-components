module DsfrComponent
  class ModalComponent < DsfrComponent::Base
    renders_many :buttons, ButtonComponent

    # @param title [String] Titre de la modale
    def initialize(title:, classes: [], html_attributes: {})
      @title = title

      @id = html_attributes[:id]
      super(classes: classes, html_attributes: html_attributes)
    end

  private

    attr_reader :title, :title_icon, :id

    def default_attributes
      {
        class: "fr-modal",
        role: "dialog",
        id: @id,
        "aria-labelledby": title_id
      }.compact
    end

    def title_id
      "#{@id}-title" if @id.present?
    end
  end
end
