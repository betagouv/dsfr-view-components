class DsfrComponent::HeaderComponent::OperatorImageComponent < DsfrComponent::Base
  # @param title [String] Le title du lien vers la page d'accueil du site
  # @param src [String] L'attribut src qui sera passé au tag img
  # @param alt [String] Le texte alternatif qui sera passé au tag img. Il doit impérativement contenir le texte présent dans l’image.
  def initialize(title:, src:, alt:, classes: [], html_attributes: {})
    @title = title
    @src = src
    @alt = alt

    super(classes: classes, html_attributes: html_attributes)
  end

  def call
    tag.div(class: "fr-header__operator") do
      tag.a(href: "/", title: title) do
        tag.img(class: "fr-responsive-img", src: src, alt: alt, style: "max-width:9.0625rem;")
      end
    end
  end

  def default_attributes
    {}
  end

private

  attr_reader :title, :src, :alt
end
