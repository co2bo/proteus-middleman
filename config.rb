
##
# Sprockets
activate :sprockets do |c|
  c.expose_middleman_helpers = true
end

##
# Autoprefixer
activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

##
# Pretty URLs
activate :directory_indexes

##
# Relative Links
set :relative_links, true

##
# Asset Pipeline Sets
set :css_dir,    'assets/stylesheets'
set :fonts_dir,  'assets/fonts'
set :images_dir, 'assets/images'
set :js_dir,     'assets/javascripts'

##
# Default Layout
set :layout, 'layouts/application'

##
# Width no Layout
page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

#----------------------------------------------------
# Development-specific Configuration
#----------------------------------------------------

configure :development do
  activate :livereload do |reload|
    reload.no_swf = true
  end
end

#----------------------------------------------------
# Production-specific Configuration
#----------------------------------------------------

configure :production do
  activate :gzip
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
end

#----------------------------------------------------
# Deploy-specific Configuration
#----------------------------------------------------

activate :deploy do |deploy|
  deploy.build_before  = true
  deploy.deploy_method = :git
end
