require 'ostruct'
require 'tilt'

module Helpers
  # This class exists purely to pass to render in format_slim, it doesn't appear
  # to matter what's passed in so long as the first arg responds to #variants
  # and the result responds to #first. Couldn't work out from Rails what the
  # correct objects to pass in here are, it's a bit meta.
  class FakeView < ActionView::Base
    def initialize
      super(OpenStruct.new(variants: OpenStruct.new(first: nil)), [], [])
    end

    def variants
      []
    end

    def protect_against_forgery?
      false
    end
  end

  module Formatters
    def block_has_content?(block)
      block.call
    end

    def format_haml(raw, data = nil)
      locals = if data
                 eval(data)
               else
                 {}
               end

      template = Tilt::HamlTemplate.new { raw }.render(FakeView.new, **locals)

      beautify(CGI.unescapeHTML(CGI.unescapeHTML(template)))
    end

  private

    def beautify(html)
      # All tags except textarea appear to line up correctly when
      # newlines are placed after tags and before closing tags,
      # except textarea which we need to account for manually 😒
      HtmlBeautifier
        .beautify(
          html
            .gsub(">", ">\n")
            .gsub("\<\/", "\n\<\/")
            .gsub(/>\s+<\/textarea>/, "></textarea>")
            .strip
        )
    end
  end
end
