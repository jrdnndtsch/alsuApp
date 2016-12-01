CarrierWave.configure do |config|
                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_KEY_ID'],                        # required
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],                        # required
    # region:                'us-west-2'                 # optional, defaults to 'us-east-1'
    # host:                  'localhost',             # optional, defaults to nil
    # endpoint:              'http://localhost:3000' # optional, defaults to nil
  }
  config.fog_directory  = 'alsu'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end