require "refile/backend/s3"

if Rails.env.production?
aws = {
  access_key_id: Rails.application.secrets.s3_key, 
  secret_access_key: Rails.application.secrets.s3_secret, 
  bucket: "adlit",
  region: "eu-west-1"
}

Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)
end
