# frozen_string_literal: true

module DsfrComponent
  module Traits
    # HeaderSizeable is meant for every component that exhibits a
    # header, which level can be overriden via the
    # `default_header_level` method. Make sure you store the attribute
    # `@starting_header_level` in your component's constructor.
    module HeaderSizeable
      DEFAULT_HEADER_LEVEL = 3

      def starting_header_level
        @starting_header_level || default_header_level
      end

      def default_header_level
        DEFAULT_HEADER_LEVEL
      end

      def starting_header_tag
        ["h", starting_header_level].join
      end
    end
  end
end
