{ expect }           = require \chai
{ validate, exists } = require \../lib/main

# Twitter Handle Validation
# letters, numbers and underscores only, and a maximum of 15 characters.
describe "Validate Twitter Handle:" (_) ->

  it "It should be prefixed with '@'" ->
    expected = false
    given = "twitter"
    actual = validate(given)
    expect(actual).to.eql(expected)

  it "It should accept an '_'" ->
    expected = true
    given = "@twitter_handle"
    actual = validate(given)
    expect(actual).to.eql(expected)

  it "It should accept a number" ->
    expected = true
    given = "@twitter88"
    actual = validate(given)
    expect(actual).to.eql(expected)

  it "It shouldn't be longer than 15 characters" ->
    expected = false
    given = "@twitterhandlethatisreallylong"
    actual = validate(given)
    expect(actual).to.eql(expected)

  it "It shouldn't accept symbols" ->
    expected = false
    given = "@twitter%^"
    actual = validate(given)
    expect(actual).to.eql(expected)

  it "It shouldn't accept dashes" ->
    expected = false
    given = "@twitter-handle"
    actual = validate(given)
    expect(actual).to.eql(expected)

  it "It shouldn't accept spaces" ->
    expected = false
    given = "@twitter handle"
    actual = validate(given)
    expect(actual).to.eql(expected)

describe "Check Existance of Twitter Handle:" (_) ->
  it "It should determine that @sphvn exists" (done) ->
    expected = true
    given = "@sphvn"
    actual <- exists given
    expect(actual).to.eql(expected)
    done!

  it "It should determine that @mort is invalid" (done) ->
    expected = false
    given = "@mort"
    actual <- exists given
    expect(actual).to.eql(expected)
    done!

  it "It should determine that @root is invalid" (done) ->
    expected = false
    given = "@root"
    actual <- exists given
    expect(actual).to.eql(expected)
    done!
