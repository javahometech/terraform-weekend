module "instances" {
  source = "../modules/ec2"
  instances_count = 2
}
