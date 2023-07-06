# frozen_string_literal: true

module HexletCode
  class HtmlBuilder
    def self.form(children, url: '#', method: 'post', **args)
      Tag.build('form', action: url, method:, **args.slice(:class)) do
        build_form_content(children)
      end
    end

    def self.build_form_content(children)
      input_tags = children[:inputs].flat_map do |elem|
        input = if elem[:html_options][:as] == :text
                  build_textarea(**elem)
                else
                  build_input(**elem)
                end
        [build_label(elem[:name]), input]
      end
      [*input_tags, build_submit(**children[:submit])].join
    end

    def self.build_submit(type:, value:)
      Tag.build('input', type:, value:)
    end

    def self.build_label(name)
      Tag.build('label', { for: name }) { name.capitalize }
    end

    def self.build_textarea(name:, value: '', cols: 20, rows: 40, **html_options)
      Tag.build('textarea', {
                  name:,
                  cols:,
                  rows:,
                  **html_options.slice(:class)
                }) { value }
    end

    def self.build_input(name:, value: '', type: 'text', **html_options)
      Tag.build('input', {
                  name:,
                  type:,
                  value:,
                  **html_options.slice(:class)
                })
    end
  end
end
