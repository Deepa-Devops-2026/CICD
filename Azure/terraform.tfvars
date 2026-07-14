subscription_id = "afb0866f-5238-427d-8816-ce7e7a93632f"

resource_group = {
  name     = "rg-deepa-dev"
  location = "South India"
}

virtual_network = {
  name          = "vnet-deepa-dev"
  address_space = ["10.0.0.0/16"]
}

subnet = {
  name             = "subnet-deepa-dev"
  address_prefixes = ["10.0.1.0/24"]
}

nsg = {
  name = "nsg-deepa-dev"
}

public_ip = {
  name = "pip-deepa-dev"
}

nic = {
  name = "nic-deepa-dev"
}

vm = {
  name       = "vm-deepa-dev"
  size       = "Standard_D2s_v3"
  admin      = "azureuser"
  public_key = "/home/deepa/.ssh/id_rsa.pub"
}

storage_account = {
  name = "deepadev24071401"
}

storage_container = {
  name = "tfstate"
}
