
#$redis = Redis.new(:host => ENV["REDISTOGO_URL"], :port => 6379)

#redis_url = ENV["REDISTOGO_URL"] || "redis://127.0.0.1:6379/0/myapp"
uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/")
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)


