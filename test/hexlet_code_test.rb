# frozen_string_literal: true

require 'test_helper'

User = Struct.new(:name, :job, keyword_init: true)

describe 'Assertions1' do
  it 'test form_for with submit' do
    user = User.new job: 'hexlet'

    result = HexletCode.form_for user do |f|
      f.input :job, as: :text, class: 'active'
    end

    expected = "<form action='#' method='post'>" \
               "<label for='job'>Job</label>" \
               "<textarea name='job' cols='20' rows='40' class='active'>hexlet</textarea>" \
               '</form>'

    assert_equal expected, result
  end
end

describe 'Assertions2' do
  it 'test form_for with submit' do
    user = User.new job: 'hexlet'

    result = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Save'
    end

    expected = "<form action='#' method='post'>" \
               "<label for='name'>Name</label>" \
               "<input name='name' type='text' value=''>" \
               "<label for='job'>Job</label>" \
               "<input name='job' type='text' value='hexlet'>" \
               "<input type='submit' value='Save'></form>"

    assert_equal expected, result
  end
end
