require 'pry'
require 'action_view'
require 'action_controller'
require 'htmlbeautifier'
require 'slim/erb_converter'
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

require 'components/dsfr_component'
require 'components/dsfr_component/traits'
require 'components/dsfr_component/traits/custom_html_attributes'
require 'components/dsfr_component/base'
require 'components/dsfr_component/alert_component'
require 'components/dsfr_component/accordion_component'
require 'components/dsfr_component/accordion_component/section_component'

require 'helpers/dsfr_link_helper'

use_helper DsfrLinkHelper
use_helper DsfrComponentsHelper
use_helper Examples::CommonOptionsHelpers
use_helper Examples::AlertHelpers
use_helper Examples::AccordionHelpers
