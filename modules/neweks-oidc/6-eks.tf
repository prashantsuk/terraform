resource "aws_iam_role" "demo" {
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "demo-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo.name
}

resource "aws_eks_cluster" "demo" {
  name     = "demo"
  role_arn = aws_iam_role.demo.arn

  vpc_config {
    //subnet_ids = [
      //aws_subnet.private-us-east-1a.id,
      //aws_subnet.private-us-east-1b.id,
      //aws_subnet.public-us-east-1a.id,
      //aws_subnet.public-us-east-1b.id
    //]
    subnet_ids = ["subnet-03490d7659934cd0f","subnet-040a1873ebd64c1b0","subnet-0048e37bd7c59c56d","subnet-0666295e9e727ffb0","subnet-0bfc7b3bf4be8a043","subnet-0d32a83c2a5975715"]
  }

  depends_on = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy]
}
