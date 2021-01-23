module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 2

  ami                    = "ami-00ddb0e5626798373"
  instance_type          = "t2.micro"
  key_name               = "rrtesting"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.sg_ec2.id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


