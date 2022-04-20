resource "aws_security_group" "single_sg_mgmt" {
  name_prefix = "single_sg_mgmt"
  vpc_id          = module.vpc.vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
      var.vpc_cidr]
  }
}

resource "aws_security_group" "all_sg_mgmt" {
  name_prefix = "all_sg_mgmt"
  vpc_id          = module.vpc.vpc_id

  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80

    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.0.0.0/16"]
  }
}

resource "aws_iam_policy" "worker_policy" {
  name        = "worker-policy"
  description = "Worker policy for the ALB Ingress"

  policy = file("iam-policy.json")
}