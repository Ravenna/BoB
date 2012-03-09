AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['MyAccessKey'],
  :secret_access_key => ENV['MySecretKey']
)