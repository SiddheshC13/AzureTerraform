

variable "spokerg1" {
  default = "Spoke_RG1"
}

variable "spoke_vnet1" {
  default = "spoke-vnet-1(QA)"
}

variable "vnet1add" {
  type    = string
  default = "10.1.2.0/23"
}

variable "spoke_subnet1" {
  default = "spoke-subnet-1_QA"
}

variable "subnet1add" {
  type    = string
  default = "10.1.3.0/27"
}


variable "spokerg2" {
  default = "Spoke_RG2"
}

variable "spoke_vnet2" {
  default = "spoke-vnet-2(QA)"
}

variable "vnet2add" {
  type    = string
  default = "10.1.4.0/23"
}

variable "spoke_subnet2" {
  default = "spoke-subnet-2(QA)"
}

variable "subnet2add" {
  type    = string
  default = "10.1.5.0/26"
}

variable "vmspoke1" {
  default = "spoke1vm_QA"
}

variable "vmspoke2" {
  default = "spoke2vm_QA"

}
