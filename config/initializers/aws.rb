CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAITTEUAOORCXZEGIQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    # host:                  's3.exampsle.com',             # optional, defaults to nil
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'hanbin'                                      # required
  # config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = {  } # optional, defaults to {}
end