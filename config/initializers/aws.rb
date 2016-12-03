# Make the connection.
AWS.config(
 access_key_id:      ENV['AWS_KEY_ID'],
 secret_access_key:  ENV['AWS_KEY'] )

S3 = AWS::S3.new.buckets[ 'alsu-app-dev' ]