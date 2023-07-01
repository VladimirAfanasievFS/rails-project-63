# frozen_string_literal: true

module HexletCode
  # helper create Tag
  class Tag
    def self.build(name, args = {})
      params = ""

      args.each do |key, value|
        params = "#{params} #{key}='#{value}'"
      end

      if block_given?
        "<#{name}#{params}>#{yield}</#{name}>"
      else
        "<#{name}#{params}>"
      end
    end
  end
end
