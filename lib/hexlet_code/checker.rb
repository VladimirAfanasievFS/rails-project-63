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
      @user.public_send(:name)

      if html_options[:as] == :text
        @output << Tag.build("textarea",
                             { name:, cols: html_options[:cols] || 20,
                               rows: html_options[:rows] || 40, **html_options.slice("class") }) { @user[:job] }
      else
        pp @user
        @output << Tag.build("label",
                             { for: name }) { name.capitalize }
        @output << Tag.build("input",
                             { name:, type: html_options[:type] || "text",
                               value: @user[name], **html_options.slice(:class) })
      end
    end

    def submit(name = "save")
      @output << Tag.build("input", type: "submit", value: name)
    end
  end
end
