class DsfrComponent::Base < ViewComponent::Base
  using HTMLAttributesUtils

  attr_reader :html_attributes

  delegate :config, to: Dsfr::Components

  HEADING_LEVELS = [1, 2, 3, 4, 5, 6].freeze

  SIZES = %i[sm md lg].freeze

  def initialize(html_attributes: {})
    @html_attributes = default_attributes
      .deep_merge_html_attributes(html_attributes)
      .deep_tidy_html_attributes

    super
  end
end
