api_key      = ""        # API Key created in Intersight
secret_key   = ""        # Path to Secret Key File
organization = "default" # Organization Name in Interesight
network_policy_list = [
  {
    name                       = ""                 # policy list name
    network_pod_cidr_block     = ""                 # cidr block for bods
    network_service_cidr_block = ""                 # cidr block for services
    ntp                        = [""]               # list of NTP servers
    dns                        = [""]               # list of DNS servers
    timezone                   = "America/New_York" # timezone
    domain_name                = ""                 # Domain Name
  }
]
ip_pool_list = [
  {
    name             = "" # pool name
    starting_address = "" # starting address for IP Pool
    size             = "" # Number of addresses in the pool
    netmask          = "" # subnet of pool
    gateway          = "" # gateway of IP Pool
    dns1             = "" # Primary DNS of Pool
    dns2             = "" # Secondary DNS of Pool
  }
]
instance_type = [ # instance types example, change as needed.
  {
    name   = "small"
    cpu    = 4
    memory = 16384
    disk   = "40"
  },
  {
    name   = "medium"
    cpu    = 6
    memory = 24576
    disk   = "60"
  },
  {
    name   = "large"
    cpu    = 8
    memory = 32768
    disk   = "80"
  },
]
k8s_version_list = [ # IKS version
  {
    name    = "1.18.12"
    version = "v1.18.12"
  }
]

addon_list = [ # addons supported in IKS
  {
    name             = "kubernetes-dashboard"
    upgrade_strategy = "UpgradeOnly"
    policy_name      = "default"
  },
  {
    name             = "ccp-monitor"
    upgrade_strategy = "UpgradeOnly"
    policy_name      = "default"
  },
  {
    name             = "efk"
    upgrade_strategy = "UpgradeOnly"
    policy_name      = "default"
  }
]
addon_policy_name = "default" # default addon policy name

infra_list = [ # infrastructure provider information
  {
    name          = ""   # K8s Infra Provider Name
    device_name   = ""   # Device Name registered to Intersight
    cluster       = ""   # Cluster name in vCenter
    interfaces    = [""] # Portgroup Name in vCenter
    datastore     = ""   # Datastore Name in vCenter
    passphrase    = ""   # vCenter Admin Passphrase
    resource_pool = ""   # Recource pool for IKS Clusters

  }
]

tags = [ # tags for infrastructure created with this module
  {
    "key" : "managed_by"
    "value" : "Terraform"
  },
  {
    "key" : "environment"
    "value" : "dev"
  }
]