# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# config/initializers/assets.rb

Rails.application.config.assets.precompile += Dir[Rails.root.join("app/assets/images/**/*")].map do |path|
  Pathname.new(path).relative_path_from(Rails.root.join("app/assets/images")).to_s
end

