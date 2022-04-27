# create-lightsail

terraform:
https://blog.flan999.com/?p=652

$ docker-compose run terraform init

$ docker-compose run terraform plan

$ docker-compose run terraform apply

cfn:
https://dev.classmethod.jp/articles/update-amazon-lightsail-for-cloudformation/

s3://model-test/light-cfn.yml
https://model-test.s3.ap-northeast-1.amazonaws.com/light-cfn.yml

docker-compose -f docker-compose-aws.yml up
docker run -it --rm -v $(pwd):/root/ --env-file=.env lightsail_aws-cli-container bash