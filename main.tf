terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.40" # Choose an appropriate version for your setup
    }
  }
}

provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "password"
  auth_url    = "http://192.168.0.17/identity"
  region      = "RegionOne"
  domain_name = "Default"
}

resource "openstack_compute_flavor_v2" "home-flavor" {
  name  = "home-flavor"
  ram   = 2048
  vcpus = 2
  disk  = 20

  extra_specs = {
    "hw:cpu_policy"        = "CPU-POLICY"
    "hw:cpu_thread_policy" = "CPU-THREAD-POLICY"
  }
}
