# Fargate Deployment

```shell
# Create task execution role
cd fargate
aws iam --region eu-central-1 create-role --role-name ecsTaskExecutionRole --assume-role-policy-document file://task-execution-assume-role.json
aws iam --region eu-central-1 attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy

# Setup ecs cli

ecs-cli configure --cluster jobs --default-launch-type FARGATE --config-name pulfy-jobs --region eu-central-1
ecs-cli configure profile --access-key AWS_ACCESS_KEY_ID --secret-key AWS_SECRET_ACCESS_KEY --profile-name pulfy-jobs

# Create the cluster and configure the security group
ecs-cli up --cluster-config pulfy-jobs --ecs-profile pulfy-jobs

ecs-cli compose --project-name event-updater service up --create-log-groups --cluster-config pulfy-jobs --ecs-profile pulfy-jobs

# Create log group
aws logs create-log-group --log-group-name pulfy-jobs

# Deploy task definition
ecs-cli compose --project-name event-updater --file ./docker-compose.yml --ecs-params ./ecs-params.yml --region eu-central-1 create --launch-type FARGATE

# Create task scheduler

aws events put-rule --schedule-expression "cron(0 2 ? * 1 *)" --name weekly-event # every monday at 2 am
aws events put-targets --rule "weekly-event" --targets file://scheduled-task-weekly-events.json
```
