require "refile/backend/s3"

if Rails.env.production?
  aws = {
    access_key_id: ENV["AWS_ACCESS_KEY_ID"], 
    secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"], 
    bucket: "adlit"
  }

  Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)
  Refile.host = "http://d1e4k3tmal57z3.cloudfront.net"
end
