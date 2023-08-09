resource "azurerm_windows_virtual_machine" "virtualmachine" {
  name                  = var.virtualmachine_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.virtualmachine.id]
  size                  = "Standard_B2als_v2"

  os_disk {
    name                 = "${var.virtualmachine_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  admin_username = "adminuser"
  admin_password = "P@ssw0rd1234!"
}

resource "azurerm_network_interface" "virtualmachine" {
  name                = "${var.virtualmachine_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.virtualmachine_name}-nic-config"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_security_group" "virtualmachine" {
  name                = var.networksecuritygroup_name
  location            = var.location
  resource_group_name = var.resource_group_name

  #Inbound
  security_rule {
    name                       = "AllowIB_Bast"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "10.1.1.0/27"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowIB_Bast1"
    priority                   = 160
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.1.1.0/27"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowIB_Bast2"
    priority                   = 170
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "10.1.1.0/27"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "virtualmachine" {
  network_interface_id      = azurerm_network_interface.virtualmachine.id
  network_security_group_id = azurerm_network_security_group.virtualmachine.id
}

