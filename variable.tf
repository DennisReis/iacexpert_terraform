variable "hash_commit" {
    default = "806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44"
}

variable "environment" {
    type        = string
    default     = "staging"
    description = "The environment of instance"
}

variable "plus" {
    default = 2
}

variable "production" {
    default = true
}

variable "instance_type" {
    type        = list(string)
    default     = ["t2.micro", "t3.medium"]
    description = "The  list of the instances types"
}

variable "blocks" {
    type        = list(object({
        device_name = string
        volume_size = string
        volume_type = string
    }))
    description = "list of EBS block"
}