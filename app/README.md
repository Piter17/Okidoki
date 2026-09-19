It is repository for communicator app. Tested on Web, Android and Mac. Repository for server is [here](https://github.com/Piter17/okidoki.backend). At the moment email is not verified so you can use any email in registration. However you cannot restore your password if forgotten.

## api_bindings
In api_bindings directory execute ./api_gen.sh. This will generate library with api mappings based on openapi schema. Requires installation of [openapi-generator-cli](https://github.com/OpenAPITools/openapi-generator-cli). Make sure if address in ./api_gen.sh is correct for your envinroment.

# Cheatsheet with useful comands

## app
```sh
dart run build_runner watch --force-jit
bareller watch
fluttergen
```

## riverpod_devtools
```sh
dart run riverpod_devtools:analyze
dart run riverpod_devtools:analyze --watch
```

## misc
```sh
scrcpy -e --mouse-bind=++++ --no-audio
```