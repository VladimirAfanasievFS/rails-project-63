# frozen_string_literal: true

require_relative 'hexlet_code/version'
# require 'active_support'
# require 'active_support/core_ext'
module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :HtmlBuilder, 'hexlet_code/html_builder'

  def self.form_for(entity, **args)
    form = HexletCode::FormBuilder.new(entity)
    yield(form)

    HexletCode::HtmlBuilder.form(form.children, **args)
  end
end
