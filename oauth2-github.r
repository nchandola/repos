library(httr)

oauth_endpoints("github")

myapp <- oauth_app("github",
         key = "",
         secret = "")

github_token <- oauth2.0_token(oauth_endpoints("github"),myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)
