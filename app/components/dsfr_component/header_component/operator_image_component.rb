class DsfrComponent::HeaderComponent::OperatorImageComponent < DsfrComponent::Base
  # @param src [String] L'attribut src qui sera passé au tag img
  # @param alt [String] Le texte alternatif qui sera passé au tag img. Il doit impérativement contenir le texte présent dans l'image.
  # @param href [String, nil] L'URL du lien vers la page d'accueil du site. Passer nil pour ne pas rendre de lien.
  # @param title [String] Le title du lien vers la page d'accueil du site. Ignoré si href est nil.
  def initialize(src:, alt:, href: "/", title: nil, html_attributes: {})
    @src = src
    @alt = alt
    @href = href
    @title = title

    super(html_attributes: html_attributes)
  end

  def call
    tag.div(class: "fr-header__operator") do
      if href
        tag.a(href: href, title: title) do
          image_tag
        end
      else
        image_tag
      end
    end
  end

  def default_attributes
    {}
  end

private

  attr_reader :src, :alt, :href, :title

  def image_tag
    tag.img(class: "fr-responsive-img", src: src, alt: alt, style: "max-width:9.0625rem;")
  end
end
