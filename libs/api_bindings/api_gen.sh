export DART_POST_PROCESS_FILE="$(whereis -q dart) format"

openapi-generator-cli generate \
    --inline-schema-name-mappings PasswordOptions=PasswordOptionsDto \
    --inline-schema-name-mappings RegisterOptions=RegisterOptionsDto \
    --enable-post-process-file 
    
flutter clean && flutter pub get && dart run build_runner build --force-jit