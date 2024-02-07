########## S3.tf 변수 ##########
# variable "artifact_bucket_name" {
#     description = "artifact S3 bucket Name" #S3 버킷 이름 설정
#     type  = string
# }

########## EC2.tf 변수 ##########
variable "instance_type" {
    description = "EC2 instance type"
    type    = string
}

variable "key_name" {
    description = "Key pair name"
    type    = string
}

variable "ami_id" {
    description = "AMI ID for Ubuntu 22.04"
    type    = string
}

variable "root_volume_size" {
    description = "root volume GB"
    type    = number
    default = 30  // 이 값은 terraform.tfvars에서 다른 값이 지정되지 않은 경우에 사용됩니다.
}


########## Code Pipeline.tf 변수 ##########
variable "aws_account_id" {
    description = "AWS Account ID"  # AWS 계정 ID
    type    = string
}

variable "codepipeline_name" {
    description = "my_codepipeline" #CodePipeline 이름
    type    = string
}

variable "codepipeline_artifact_store_location" {
    description = "S3 Bucket Name" #CodePipeline 아티팩트 저장 S3 버킷 위치 및 버킷 이름
    type    = string
}

variable "codecommit_repository_name" {
    description = "The name of the CodeCommit repository" # CodeCommit 리포지토리 이름
    type    = string
}

variable "codecommit_repository_branch" {
    description = "The branch name of the CodeCommit repository" #CodeCommit 리포지토리 브랜치 이름
    type    = string
}

########## Code Build.tf 변수 ##########
variable "codebuild_role_name" {
    description = "codebuild-role" # CodeBuild 역할 이름
    type    = string
}

variable "codebuild_policy_attachment_name" {
    description = "codebuild-policy-attachment" # CodeBuild 정책 첨부 이름
    type    = string
}

variable "codebuild_project_name" {
    description = "my-codebuild-project" # CodeBuild 프로젝트 이름
    type    = string
}

variable "codebuild_project_description" {
    description = "My CodeBuild Project" #CodeBuild 프로젝트 설명
    type    = string
}

variable "codebuild_compute_type" {
    description = "BUILD_Compute_Type" # CodeBuild 컴퓨팅 유형
    type    = string
}

variable "codebuild_image" {
    description = "code_build_image" # CodeBuild 이미지
    type    = string
}

variable "codebuild_buildspec" {
    description = "buildspec_file(ex:.yaml)" # CodeBuild 빌드 스펙 파일
    type    = string
}


########## Networking 변수 ##########
variable "region" {
    description = "The AWS region to create resources in"
    type        = string
    default     = "ap-northeast-2"
}

variable "availability_zones" {
    description = "가용 영역"
    type        = list(string)
    default     = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnets" {
    description = "CIDR blocks and availability zones for the public subnets"
    type = map(object({
    cidr_block        = string
    availability_zone = string
    }))
}

variable "private_subnets" {
    description = "CIDR blocks and availability zones for the private subnets"
    type = map(object({
    cidr_block        = string
    availability_zone = string
    }))
}

variable "rds_subnets" {
    description = "CIDR blocks and availability zones for the RDS subnets"
    type = map(object({
    cidr_block        = string
    availability_zone = string
    }))
}



### RDS ID, Password 변수 ###
variable "db_username" {
    description = "The username for the RDS database"
    type        = string
}

variable "db_password" {
    description = "The password for the RDS database"
    type        = string
}