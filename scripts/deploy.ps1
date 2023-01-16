sam build
sam package --output-template-file packaged.yaml --s3-bucket gitlab-codebucket --region eu-west-2
sam deploy --no-fail-on-empty-changeset --template-file packaged.yaml --stack-name EC2-gitlab-runner-fleet --s3-bucket gitlab-codebucket --capabilities CAPABILITY_NAMED_IAM --region eu-west-2 --parameter-overrides runnerUrl=https://gitlab.com/ runnerToken=12345 runnerExecutor=docker runnerImage=gitlab-runner:latest
