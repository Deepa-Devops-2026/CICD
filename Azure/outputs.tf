output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "storage_account" {
  value = azurerm_storage_account.storage.name
}
