# rubocop:disable Style/TrailingCommaInHashLiteral
module DsfrComponentsHelper
  HELPER_NAME_TO_CLASS_NAME = {
    dsfr_alert: 'DsfrComponent::AlertComponent',
    dsfr_accordion: 'DsfrComponent::AccordionComponent',
    dsfr_accordion_section: 'DsfrComponent::AccordionComponent::SectionComponent',
    dsfr_breadcrumbs: 'DsfrComponent::BreadcrumbsComponent',
    dsfr_tile: 'DsfrComponent::TileComponent',
    dsfr_badge: 'DsfrComponent::BadgeComponent',
    dsfr_tag: 'DsfrComponent::TagComponent',
    dsfr_stepper: 'DsfrComponent::StepperComponent',
    dsfr_button: 'DsfrComponent::ButtonComponent',
    dsfr_modal: 'DsfrComponent::ModalComponent',
    dsfr_header: 'DsfrComponent::HeaderComponent',
    dsfr_header_tool_link: 'DsfrComponent::HeaderComponent::ToolLinkComponent',
    dsfr_header_direct_link: 'DsfrComponent::HeaderComponent::DirectLinkComponent',
    dsfr_header_direct_dropdown_link: 'DsfrComponent::HeaderComponent::DirectLinkDropdownComponent',
    dsfr_tabs: 'DsfrComponent::TabsComponent',
    dsfr_highlight: 'DsfrComponent::HighlightComponent',
    dsfr_skiplink: 'DsfrComponent::SkiplinkComponent',
    dsfr_callout: 'DsfrComponent::CalloutComponent',
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
