page "/index.html", layout: :landing

set :build_dir, 'tmp'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :development do
  activate :livereload
  activate :dotenv
end

activate :directory_indexes
activate :relative_assets

helpers do
  def mailchimp_form_url
    "//railsbridgeboston.us6.list-manage.com/subscribe/post?u=1b4272afae4569dec6efb74bb&amp;id=1ec91857a1"
  end
end
