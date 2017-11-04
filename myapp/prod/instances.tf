module "instances" {
  source = "../modules/ec2"
  instances_count = 5
  instance_type = "t2.large"
}
