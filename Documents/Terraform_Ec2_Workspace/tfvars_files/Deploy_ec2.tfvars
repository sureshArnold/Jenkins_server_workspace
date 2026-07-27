sg_inbound_rules = [
   {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
        from_port   = 80
        to_port     = 80       
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
]

sg_outbound_rules = [
    {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
]

instance_type = "t3.micro"
root_volume = {
    volume_size = 10
    volume_type = "gp2"
    delete_on_termination = true
}

is_public = true

custom_key_pair_name = "ec2-key"

ami_id = "ami-00adafae70b8029d8"
ami_type = "rhel9"

Instance_name = "JenkinsServer"

enable_custom_user_data = true

security_group_name = "Jenkins_server_security_group"
