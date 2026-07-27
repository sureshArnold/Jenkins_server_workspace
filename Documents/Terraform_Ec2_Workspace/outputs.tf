output "jenkins_security_group" {
    description = "Security group ID of the Jenkins server"
    value       = try(aws_security_group.jenkins[0].id , null)
}