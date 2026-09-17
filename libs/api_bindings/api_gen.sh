export DART_POST_PROCESS_FILE="$(whereis -q dart) format"

openapi-generator-cli generate \
    --config config.yaml \
    -g dart-dio \
    -i https://api.okidoki.fun/openapi/v1.json \
    --enable-post-process-file 
    
flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs