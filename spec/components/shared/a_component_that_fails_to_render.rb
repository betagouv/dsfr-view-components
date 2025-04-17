shared_examples 'a component that fails to render' do |error_message_regexp|
  it "raises an error" do
    rendering = if defined?(content) && content.present?
                  -> { render_inline(component).with_content(content) }
                else
                  -> { render_inline(component) }
                end

    expect { rendering.call }.to raise_error(ArgumentError, error_message_regexp)
  end
end
