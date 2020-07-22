data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["IaaSWeek-${var.hash_commit}"] 
    }

    owners = ["178520105998"]
}

resource "aws_instance" "web" {
    count         = var.servers
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    key_name      = "container-expert"

    tags = {
        Name     = "HelloWorld"
        Training = "linuxtips"
        Subject  = "terraform"
    }
}