# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, keyword_init: true)

describe 'Assertions' do
  it 'test form_for with submit' do
    user = User.new job: 'hexlet'

    result = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Save'
    end

    assert result == "<form action='#' method='post'>" \
                     "<label for='name'>Name</label>" \
                     "<input name='name' type='text' value=''>" \
                     "<label for='job'>Job</label>" \
                     "<input name='job' type='text' value='hexlet'>" \
                     "<input type='submit' value='Save'></form>"
  end
end
