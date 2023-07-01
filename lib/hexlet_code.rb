# frozen_string_literal: true

require_relative "hexlet_code/version"
# require 'active_support'
# require 'active_support/core_ext'

module HexletCode
  class Error < StandardError; end
  autoload :Tag, "hexlet_code/tag"

  autoload :Checker, "hexlet_code/checker"

  def self.form_for(user, args = {})
    url = args[:url] || "#"
    Tag.build("form", action: url, method: "post") do
      checker = HexletCode::Checker.new(user)
      yield(checker)
      checker.output.join
    end
  end

end
