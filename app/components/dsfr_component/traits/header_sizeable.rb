# frozen_string_literal: true

module DsfrComponent
  module Traits
    # HeaderSizeable is meant for every component that exhibits a
    # header which level can be overriden. Make sure you use the
    # setter (self.header_level) in your component's constructor.
    module HeaderSizeable
      DEFAULT_HEADER_LEVEL = 3

      def header_level
        @header_level || default_header_level
      end

      def header_level=(level)
        return if level.nil?

        raise ArgumentError, "Le niveau du titre doit être compris entre 1 et 6" if !correct?(level)

        @header_level = level
      end

      def default_header_level
        DEFAULT_HEADER_LEVEL
      end

      def header_tag
        ["h", header_level].join
      end

    private

      def correct?(level)
        level.in?(DsfrComponent::Base::HEADING_LEVELS)
      end
    end
  end
end
