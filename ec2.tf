data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["IaaSWeek-${var.hash_commit}"] 
    }

    owners = ["178520105998"]
}

resource "aws_instance" "web" {
    #count         = var.environment == "production" ? 2 + var.plus : 1
    ami           = data.aws_ami.ubuntu.id
    #instance_type = count.index < 1 ? "t2.micro" : "t3.medium"
    #for_each      = {
    #    dev     = "t2.micro"
    #    staging = "t3.medium"
    #}
    for_each      = toset(var.instance_type)
    instance_type = each.value
    key_name      = "container-expert"

    dynamic "ebs_block_device" {
        for_each = var.blocks
        content {
          device_name = ebs_block_device.value["device_name"]
          volume_size = ebs_block_device.value["volume_size"]
          volume_type = ebs_block_device.value["volume_type"]
        }        
    }

    tags = {
        Name     = "HelloWorld"
        Training = "linuxtips"
        Subject  = "terraform"
        Env      = var.environment
    }
}