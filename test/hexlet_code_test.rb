# frozen_string_literal: true

require "test_helper"

User = Struct.new(:name, :job, keyword_init: true)

describe "Assertions" do
  # it "test_create_single_tag" do
  #   assert HexletCode::Tag.build("br") == "<br>"
  #   assert HexletCode::Tag.build("img", src: "path/to/image") == "<img src='path/to/image'>"
  #   assert HexletCode::Tag.build("input", type: "submit", value: "Save") == "<input type='submit' value='Save'>"
  # end

  # it "test_create_double_tag" do
  #   assert HexletCode::Tag.build("label") { "Email" } == "<label>Email</label>"
  #   assert HexletCode::Tag.build("label", for: "email") { "Email" } == "<label for='email'>Email</label>"
  #   assert HexletCode::Tag.build("div") {} == "<div></div>"
  # end

  # it "test_form_for" do
  #   # Создаем конкретно пользователя и заполняем имя
  #   user = User.new name: "rob", job: "hexlet",

  #   assert HexletCode.form_for(user) { |f| } == "<form action='#' method='post'></form>"
  #   assert HexletCode.form_for(user, url: "/users") { |f| } == "<form action='/users' method='post'></form>"
  #   result = HexletCode.form_for user do |f|
  #     f.input :name
  #     f.input :job, as: :text
  #   end
  #   assert result == "<form action='#' method='post'><input name='name' type='text' value='rob'><textarea name='job' cols='20' rows='40'>hexlet</textarea></form>"
  # end

  # it "test_form_for lastparam" do
  #   user = User.new name: "rob", job: "hexlet", gender: "m"

  #   result = HexletCode.form_for user, url: "#" do |f|
  #     f.input :name, class: "user-input"
  #     f.input :job
  #   end

  #   assert result == "<form action='#' method='post'><input name='name' type='text' value='rob' class='user-input'><input name='job' type='text' value=''></form>"
  # end

  # it "test form_for textbox rewrite default" do
  #   user = User.new name: "rob", job: "hexlet", gender: "m"

  #   result = HexletCode.form_for user, url: "#" do |f|
  #     f.input :job, as: :text, rows: 50, cols: 50
  #   end

  #   assert result == "<form action='#' method='post'><textarea cols='50' rows='50' name='job'>hexlet</textarea></form>"
  # end

  it "test form_for with submit" do
    user = User.new job: "hexlet"

    result = HexletCode.form_for user, url: "#" do |f|
      f.input :name
      f.input :job
      f.submit "Wow"
    end

    assert result == "<form action='#' method='post'><label for='name'>Name</label><input name='name' type='text' value=''><label for='job'>Job</label><input name='job' type='text' value='hexlet'><input type='submit' value='Wow'></form>"
  end
end
