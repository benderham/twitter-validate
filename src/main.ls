https = require \https

validate = (handle) ->
  re = /^(?:@)([A-Za-z0-9_]){1,15}$/
  re.test handle

exists = (handle, cb) ->
  url = "https://twitter.com/users/username_available?username=#{handle.substr(1)}"
  https.get url, (res) ->
    body = ''
    res.on \data (chunk) -> body += chunk
    res.on \end -> cb (JSON.parse(body).reason == \taken)
  .on \error (_) -> cb undefined

export validate, exists
