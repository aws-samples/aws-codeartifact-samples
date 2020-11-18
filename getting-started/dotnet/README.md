![Foundation](../../static/upstream.jpg)

## Steps

1. Go to `cloudformation` directory

    ```
    cd cloudformation/
    ```

2. Deploy stack using AWS CLI

    ```
    aws cloudformation deploy \
    --stack-name aws-codeartifact-samples \
    --template-file deploy.yml \
    --no-fail-on-empty-changeset \
    --region us-west-2
    ```

3. Describe stack using AWS CLI

    ```
    aws cloudformation describe-stacks \
    --stack-name aws-codeartifact-samples \
    --region us-west-2
    ```

4. Go to `sample` directory
    ```
    cd ../sample
    ```

5. Login to AWS CodeArtifact
    ```
    aws codeartifact login --tool nuget --repository my-team-repository --domain example-domain --domain-owner <<ACCOUNT_ID>>
    ```

6. Build and publish the shared project
    ```
    cd .\Shared
    .\publish.ps1
    ```

7. Add the `shared` package to the main program
    ```
    cd ..\NugetCodeArtifact
    dotnet add package shared
    ```

8. Build the main project
    ```
    dotnet build
    ```
