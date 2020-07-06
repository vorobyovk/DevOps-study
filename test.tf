provider "aws" {
    access_key = "AKIAU23QCVDUOUZZUPWI"
    secret_key = "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"
    region = "eu-central-1"
}

resource "aws_instance" "my_ubuntu" {
    ami            = "ami-0d359437d1756caa8"
    instance_type  = "t2.micro"
}
