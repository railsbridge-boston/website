page "/index.html", layout: :landing

set :build_dir, 'tmp'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
end

configure :development do
  activate :livereload
end
