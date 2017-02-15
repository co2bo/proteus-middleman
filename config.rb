##
# Sprockets
activate :sprockets do |c|
  c.expose_middleman_helpers = true
end

##
# Autoprefixer
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', '> 10%']
  config.cascade  = false
  config.inline   = true
end

##
# Image Tag Helper
activate :automatic_image_sizes

##
# Pretty URLs
activate :directory_indexes
page '/404.html', directory_index: false

##
# Relative Links
config[:relative_links] = true

##
# Asset Pipeline Sets
confi[:css_dir]    = 'assets/stylesheets'
confi[:fonts_dir]  = 'assets/fonts'
confi[:images_dir] = 'assets/images'
confi[:js_dir]     = 'assets/javascripts'

#----------------------------------------------------
# Layout-specific Configuration
#----------------------------------------------------

##
# Default Layout
config[:layout] = 'layouts/application'

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
# Helpers
#----------------------------------------------------

helpers do
  # If you need helpers for use in this file, then you
  # can define them here. Otherwise, they should be defined
  # in `helpers/custom_helpers.rb`.
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
