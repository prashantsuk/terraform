cluster_name                    = "test-cluster"
cluster_version                 = "1.22"
vpc_id                          = "vpc-0c3db624aea4c7b63"
subnet_ids                      = ["subnet-040c7e379930fdc61", "subnet-08ef1853bb666117f", "subnet-0346c260bfbafda8e"] /*private subnet*/
instance_type                   = "m6i.large"
iam_role_additional_policies    = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"] /*need to pass */
cluster_endpoint_private_access = true
cluster_endpoint_public_access  = true
region                          = "us-west-2"

self_managed_node_groups = [{
  one = {
    name         = "mixed-1"
    max_size     = 5
    desired_size = 2

    use_mixed_instances_policy = true
    mixed_instances_policy = {
      instances_distribution = {
        on_demand_base_capacity                  = 0
        on_demand_percentage_above_base_capacity = 10
        spot_allocation_strategy                 = "capacity-optimized"
      }

     
    }
  }
}]