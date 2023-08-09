variable "serviceprincipal1" {
  description = "Enter your details for connecting with your account"
  type        = map(any)
  default = {
    subs_id      = "754a1399-426f-48cf-aa53-609abfb947db"
    clientid     = "a199cec1-24a2-46d1-8ef4-9ca2630b8674"
    clientsecret = "OBh8Q~5.xRLtkh4yHDDKUYcgqGfTEWnYlq63CaX3"
    tenantid     = "21824c05-eff6-477c-ba01-6443c7bba628"
  }
}

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
