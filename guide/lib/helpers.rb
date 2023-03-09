require 'pry'
require 'action_view'
require 'action_controller'
require 'htmlbeautifier'
require 'active_support/core_ext/hash/deep_merge'
require 'active_support/core_ext/string/starts_ends_with'
require 'pagy'

Dir.glob(File.join('./lib', '**', '*.rb')).sort.each { |f| require f }

use_helper Nanoc::Helpers::Rendering
use_helper Nanoc::Helpers::LinkTo
use_helper Nanoc::Helpers::XMLSitemap
use_helper Helpers::LinkHelpers
use_helper Helpers::TitleAnchorHelpers
use_helper Helpers::Formatters
use_helper Helpers::ContentHelpers

$LOAD_PATH.unshift(File.expand_path("../../app", "app"))
$LOAD_PATH.unshift(File.expand_path("../../lib", "lib"))

require 'dsfr/components'

# FIXME
# cf https://github.com/DFE-Digital/govuk-components/commit/a77dd4d55fb7a4afc7d2911174e62dbe4da08545
# cf https://github.com/ViewComponent/view_component/issues/1565
ViewComponent::Base.config.view_component_path = "app/components"

require 'components/dsfr_component'
require 'components/dsfr_component/traits'
require 'components/dsfr_component/traits/custom_html_attributes'
require 'components/dsfr_component/base'

Dir.glob('../app/components/dsfr_component/**/*.rb').sort.each { |f| require f }

require 'helpers/dsfr_link_helper'

use_helper DsfrLinkHelper
use_helper DsfrComponentsHelper
use_helper Examples::CommonOptionsHelpers
use_helper Examples::AlertHelpers
use_helper Examples::AccordionHelpers
use_helper Examples::LinkHelpers
use_helper Examples::TileHelpers
use_helper Examples::BadgeHelpers
use_helper Examples::TagHelpers
use_helper Examples::StepperHelpers
use_helper Examples::ButtonHelpers
use_helper Examples::ModalHelpers
use_helper Examples::HeaderHelpers
use_helper Examples::TabsHelpers
