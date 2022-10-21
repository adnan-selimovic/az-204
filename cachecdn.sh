az webapp create --name wbcoffee --plan wbcoffe --resource-group wiredbrain-rg
az appservice plan create --name wbcoffe --resource-group wiredbrain-rg

# Setting Expiration Times for Redis Cahce (by default, values will not expire)
_cache.StringSet("myKey", "my Value", new TimeSpan(3,0,0)); # 3 hours

PM> Install-Package StackExchange.Redis

# Benchmarking Redis Cachse
Redis-benchmark -q -n 100000
