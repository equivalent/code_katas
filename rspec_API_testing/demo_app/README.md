# README

Source code for example in article http://www.eq8.eu/blogs/30-native-rspec-json-api-testing

## files to check

```
# example with model #as_json
app/models/article.rb
app/controllers/articles_controller.rb
spec/controllers/articles_controller_spec.rb

# example with serializer
config/application.rb
spec/spec_helper.rb
spec/support/custom_matchers/json_matchers.rb

app/serializers/article_serializer.rb
spec/serializers/article_serializer.rb

app/controllers/v2/articles_controller.rb
spec/controllers/v2/articles_controller_spec.rb
```


#### how app was generated:


Rails 5.0.0.1 app genreated with:

step 1

```bash
rails new --skip-test --skip-git --skip-sprockets --skip-spring
--skip-action-mailer  demo_app
```

step 2

````ruby
# Gemfile

gem 'rspec-rails'

```

step 3


```bash
rails g   rspec:install
```

step 4

code was written
