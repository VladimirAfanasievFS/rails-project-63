# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_accessor :children

    def initialize(entity)
      @entity = entity
      @children = {
        inputs: [],
        submit: nil
      }
    end

    def input(name, **html_options)
      pp @entity.public_send(name)
      @children[:inputs] << { name:, value: @entity.public_send(name), html_options: }
    end

    def submit(name = 'Save')
      @children[:submit] = { value: name, type: :submit }
    end
  end
end
