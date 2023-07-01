# frozen_string_literal: true

module HexletCode
  # helper Checker
  class Checker
    attr_accessor :output

    def initialize(user)
      @user = user
      @output = []
    end

    def input(name, html_options = {})
      @user.public_send(name)
      build_label(name)
      if html_options[:as] == :text
        build_textarea(name, html_options)
      else
        build_input(name, html_options)
      end
    end

    def submit(name = 'Save')
      @output << Tag.build('input', type: 'submit', value: name)
    end

    private

    def build_textarea(name, html_options)
      @output << Tag.build('textarea', {
                             name:,
                             cols: html_options[:cols] || 20,
                             rows: html_options[:rows] || 40,
                             **html_options.slice(:class)
                           }) { @user[:job] }
    end

    def build_label(name)
      @output << Tag.build('label', { for: name }) { name.capitalize }
    end

    def build_input(name, html_options)
      @output << Tag.build('input', {
                             name:,
                             type: html_options[:type] || 'text',
                             value: @user[name],
                             **html_options.slice(:class)
                           })
    end
  end
end
