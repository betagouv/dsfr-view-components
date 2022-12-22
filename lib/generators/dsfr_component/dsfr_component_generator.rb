class DsfrComponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  class_option :params, type: :hash, default: {}

  COMPONENT_FOLDER = "app/components/dsfr_component/".freeze

  def write_component
    destination = File.join(COMPONENT_FOLDER, "#{file_name}_component.rb")

    template "component.rb.erb", destination
    run "rubocop --format quiet -A #{destination}"
  end

  def write_component_spec
    destination = "spec/components/dsfr_component/#{file_name}_component_spec.rb"

    template "component_spec.rb.erb", destination
    run "rubocop --format quiet -A #{destination}"
  end

  def write_guide_page
    destination = "guide/content/components/#{file_name}.haml"

    template "component.haml.erb", destination
  end

  def write_guide_helper
    destination = "guide/lib/examples/#{file_name}_helpers.rb"

    template "component_helper.rb.erb", destination
  end

  def append_guide_helper
    destination = "guide/lib/helpers.rb"

    append_to_file destination, "use_helper Examples::#{name}Helpers"
  end

  def map_component_helper
    destination = "app/helpers/dsfr_components_helper.rb"

    marker = "# DO NOT REMOVE: new component mapping here"
    mapping = "dsfr_#{file_name}: 'DsfrComponent::#{name}Component',"

    gsub_file(destination, marker, [mapping, marker].join("\n"))

    run "rubocop --format quiet -A #{destination}"
  end
end
