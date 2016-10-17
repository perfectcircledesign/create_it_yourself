require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "e2477027b446fded558f0e1937b4a868e78699f9044bc98257273ffad18bf0b8"

  url_format "/media/:job/:name"

if Rails.env.production?
   datastore :s3,
    bucket_name: ENV['S3_BUCKET'],
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET']

else

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
  end
end

