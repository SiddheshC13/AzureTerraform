variable "serviceprincipal1" {
  description = "Enter your details for connecting with your account"
  type        = map(any)
  default = {
    subscription_id = "754a1399-426f-48cf-aa53-609abfb947db"
    clientid        = "a199cec1-24a2-46d1-8ef4-9ca2630b8674"
    clientsecret    = "OBh8Q~5.xRLtkh4yHDDKUYcgqGfTEWnYlq63CaX3"
    tenantid        = "21824c05-eff6-477c-ba01-6443c7bba628"
  }
}

variable "Spoke1-resource_group_name" {
  description = "Enter the resource group name for spoke 1"
  default     = "Spoke_RG1"
}

variable "Spoke1-VirtualNetwork_name" {
  description = "Enter the virtual network name for spoke 1"
  default     = "spoke-vnet-1-QA"
}

variable "VirtualNetwork-Address_Spoke1" {
  description = "Enter the address for virtual network"
  type        = string
  default     = "10.1.2.0/23"
}

variable "Spoke1-subnet-name" {
  description = "Enter the subnet name for spoke 1"
  default     = "spoke-subnet-1-QA"
}

variable "Spoke1-subnet_address" {
  type        = string
  description = "Enter the subnet address for spoke 1"
  default     = "10.1.3.0/27"
}


variable "Spoke2-resource_group_name" {
  description = "Enter the resource group name for spoke 2"
  default     = "Spoke_RG2"
}

variable "Spoke2-VirtualNetwork_name" {
  description = "Enter the virtual network name for spoke 2"
  default     = "spoke-vnet-2-QA"
}

variable "VirtualNetwork-Address_Spoke2" {
  type        = string
  description = "Enter the virtual network address for spoke 2"
  default     = "10.1.4.0/23"
}

variable "Spoke2-subnet-name" {
  description = "Enter the subnet name for spoke 2"
  default     = "spoke-subnet-2-QA"
}

variable "Spoke2-subnet_address" {
  description = "Enter the subnet address for spoke 2"
  type        = string
  default     = "10.1.5.0/26"
}

variable "VirtualMachine-Spoke1" {
  description = "Enter the virtualmachine name for spoke1"
  default     = "spoke1-virtualmachine"
}

variable "VirtualMachine-Spoke2" {
  description = "Enter the virtual machine name for spoke2"
  default     = "spoke2-virtualmachine"

}


variable "NetworkSecurityGroup-Name" {
  default = "centralised_nsg"
}