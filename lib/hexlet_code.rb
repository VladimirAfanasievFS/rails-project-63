# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  # method Tag
  class Tag
    def self.build(name, **options)
      props = options.entries.map do |option|
        key, value = option
        "#{key}='#{value}'"
      end

      "<#{name} #{props.join(" ")}>"
    end
  end
  # Your code goes here...
end
