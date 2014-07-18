CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'XXX',                        # required
    :aws_secret_access_key  => 'XXX',                        # required
    :region                 => 'ap-northeast-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'glrg'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end