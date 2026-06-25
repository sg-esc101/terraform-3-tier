provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias  = "osaka"
  region = "ap-northeast-3"
}