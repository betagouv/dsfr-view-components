module DsfrLinkHelper
  ICON_POSITIONS = %w(left right).freeze
  SIZES = %w(sm md lg).freeze

  # Allows generating a link via plain parameters or the block-style form, just like {Rails's link_to}[https://edgeapi.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html].
  # In addition, it accepts some custom options in
  # <tt>extra_options</tt> (or options if using block-style) specific
  # to the DSFR :
  # * <tt>icon_left</tt> [String]: name of an icon to put on the left side
  # * <tt>icon_right</tt> [String]: name of an icon to put on the right side
  # * <tt>size</tt> [String]: one of the size available in <tt>SIZES</tt>.
  # @param name [String] name of the link, same as link_to
  # @param options [Hash] hash of options, same as link_to
  # @param extra_options [Hash] hash of HTML options, same as link_to
  def dsfr_link_to(name = nil, options = nil, extra_options = nil, &block)
    extra_options = options if block_given?

    extra_options = extra_options
                    .then { |opts| add_default_class(opts) }
                    .then { |opts| add_icons(opts) }
                    .then { |opts| add_size(opts) }

    if block_given?
      link_to(name, extra_options, &block)
    else
      link_to(name, options, extra_options)
    end
  end

private

  def add_default_class(opts)
    inject_class(opts, class_name: 'fr-link')
  end

  def add_icons(opts)
    ICON_POSITIONS.each do |position|
      key = "icon_#{position}"
      icon = opts[key]

      next if icon.blank?

      opts = remove_attribute_and_add_class(opts, key, class_name: ["fr-link--icon-#{position}", "fr-icon-#{icon}"])
    end

    opts
  end

  def add_size(opts)
    size = opts['size']

    if size.present? && size.in?(SIZES)
      opts = inject_class(opts, class_name: "fr-link--#{size}")
      opts.delete(:size)
    end

    opts
  end

  def inject_class(attributes, class_name:)
    attributes ||= {}

    attributes.with_indifferent_access.tap do |attrs|
      attrs[:class] = Array.wrap(attrs[:class]).prepend(class_name).flatten.join(" ")
    end
  end
end

ActiveSupport.on_load(:action_view) { include DsfrLinkHelper }
