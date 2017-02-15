activate :autoprefixer
activate :directory_indexes

set :relative_links, true

set :css_dir,    'assets/stylesheets'
set :fonts_dir,  'assets/fonts'
set :images_dir, 'assets/images'
set :js_dir,     'assets/javascripts'

set :layout, 'layouts/application'

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
