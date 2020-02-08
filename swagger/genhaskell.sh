java -jar openapi-generator-cli.jar generate -i ../MediaRepositoryAPI\(OpenAPI\).yaml -g haskell -o servant-gen-tmp/
cp servant-gen-tmp/lib/MediaRepository/* servant/lib/MediaRepository/
