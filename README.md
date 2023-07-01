[![CI](https://github.com/VladimirAfanasievFS/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/VladimirAfanasievFS/rails-project-63/actions/workflows/main.yml)

## Installation

Add it to your Gemfile:

```ruby
gem 'HexletCode'
```

Run the following command to install it:

```console
make install
make test
make lint
```

## Usage

```ruby
User = Struct.new(:name, :job, :gender)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

form = HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
  f.submit 'Wow'
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input type="text" name="name" value="rob">
#   <label for="job">Job</label>
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
#   <label for="gender">Gender</label>
#   <input type="submit" value="Wow">
# </form>
```
