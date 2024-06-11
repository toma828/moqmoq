require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.storage = fog
  config.fog_provider = 'fog/aws'                        # required
  config.fog_public = true
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),     # required unless using use_iam_profile
    aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key_id),
    region:                'northeast-1'               # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = Rails.application.credentials.dig(:aws, :s3_bucket_name)              # required
end