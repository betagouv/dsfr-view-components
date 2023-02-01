# rubocop:disable Style/TrailingCommaInHashLiteral
module DsfrComponentsHelper
  HELPER_NAME_TO_CLASS_NAME = {
    dsfr_alert: 'DsfrComponent::AlertComponent',
    dsfr_accordion: 'DsfrComponent::AccordionComponent',
    dsfr_accordion_section: 'DsfrComponent::AccordionComponent::SectionComponent',
    dsfr_tile: 'DsfrComponent::TileComponent',
    dsfr_badge: 'DsfrComponent::BadgeComponent',
    # DO NOT REMOVE: new component mapping here
  }.freeze
  HELPER_NAME_TO_CLASS_NAME.each do |name, klass|
    define_method(name) do |*args, **kwargs, &block|
      capture do
        render(klass.constantize.new(*args, **kwargs)) do |com|
          block.call(com) if block.present?
        end
      end
    end
  end
end
# rubocop:enable Style/TrailingCommaInHashLiteral

ActiveSupport.on_load(:action_view) { include DsfrComponentsHelper }
