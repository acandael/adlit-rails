require "refile/s3"
if Rails.env.production?
  aws = {
    access_key_id: ENV["AWS_ACCESS_KEY_ID"], 
    secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"], 
    region: "eu-west-1",
    bucket: "adlit"
  }
  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
  Refile.cdn_host = "//d1e4k3tmal57z3.cloudfront.net"
end
