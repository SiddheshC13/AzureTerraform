#Spokes
variable "resource_group_name" {
  description = "Enter the resource group name"
}

variable "virtualnetwork_name" {
  description = "Enter the virtual net name"
}

variable "subnet_name" {
  description = "Enter the subnet_name"
}

variable "address" {
  type        = string
  description = "Enter the address for subnet"
}
