require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "e2477027b446fded558f0e1937b4a868e78699f9044bc98257273ffad18bf0b8"

  url_format "/media/:job/:name"

if Rails.env.production?
	 datastore :s3,
    bucket_name: 'business-card-generator-production',
    access_key_id: 'AKIAJ7KBTNXSVPH6TVQA',
    secret_access_key: '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'

else

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
  end
end

