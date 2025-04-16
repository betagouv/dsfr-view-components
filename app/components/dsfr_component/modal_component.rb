module DsfrComponent
  class ModalComponent < DsfrComponent::Base
    renders_one :header
    renders_many :buttons

    # @param title [String] Titre de la modale
    # @param opened [Boolean] Ouvre la modale dès le chargement de la page
    def initialize(title:, opened: false, html_attributes: {})
      @title = title
      @opened = opened

      @id = html_attributes[:id]
      super(html_attributes: html_attributes)
    end

  private

    attr_reader :title, :title_icon, :id

    def default_attributes
      {
        class: "fr-modal #{@opened ? 'fr-modal--opened' : ''}",
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
