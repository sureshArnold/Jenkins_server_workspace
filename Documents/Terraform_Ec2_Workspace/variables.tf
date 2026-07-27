variable "sg_inbound_rules" {
    description = "List of inbound rules for the security group"
    type        = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
  
}

variable "sg_outbound_rules" {
    description = "List of outbound rules for the security group"
    type        = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
    }))
}

variable "instance_type" {
    description = "The type of instance to launch"
    type        = string
}

variable "root_volume" {
    description = "Root volume configuration"
    type        = object({
        volume_size           = number
        volume_type           = string
        delete_on_termination = bool
    })
}

variable "ami_id" {
    description = "The ID of the AMI to use for the instance"
    type        = string
}

variable "ami_type" {
    description = "The type of the AMI (e.g., rhel9, ubuntu20.04)"
    type        = string
}   


variable "is_public"{
    description = "Boolean to determine if the instance should be public or private"
    type        = bool
}

variable "custom_key_pair_name"{
    description = "The name of the custom key pair to use for the instance"
    type        = string
    default     = ""
}

variable "Instance_name" {
    description = "The name of the instance"
    type        = string
}


variable "enable_custom_user_data" {
    description = "Boolean to determine if custom user data should be enabled"
    type        = bool
    default     = false
}

variable "security_group_name" {
    description = "The name of the security group"
    type        = string
}

