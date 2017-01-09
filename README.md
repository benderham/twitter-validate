## Twitter Validate

A Twitter handle validation tool. Checks whether a provided handle meets Twitter's handle criteria. Also provides a method to check whether a provided twitter handle already exists online.

## Installation

```
$ npm install twitter-validate
```

## Usage

| Name        | Type           | Description  |
|:------------- |:-------------|:-----|
| handle      | string | The Twitter handle to validate against Twitter specification  |
| returns      | boolean | Whether handle is valid  |

```js
validate(handle);
```

| Name        | Type           | Description  |
|:------------- |:-------------|:-----|
| handle      | string | The Twitter handle to check existence of |
| handleExists      | boolean | Whether the handle exists on Twitter |

```js
exists(handle, function(handleExists){});
```

## Example

```js
var validate = require('twitter-validate').validate;
var exists = require('twitter-validate').exists;

validate("@benderham88") // boolean

exists("@benderham88", function(handleExists){
    handleExists // boolean
});
```
