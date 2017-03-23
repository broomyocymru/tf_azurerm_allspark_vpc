output "allspark_data" {
  value = {
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    ssh_public = "${tls_private_key.ssh.public_key_openssh}"

    # Network Settings
    subnet_name = "${list(azurerm_subnet.subnet.*.name)}"
    subnet_id = "${list(azurerm_subnet.subnet.*.id)}"

    # Storage Details
    storage_container_name = "${list(azurerm_storage_container.storage.*.name)}"
    storage_account_name = "${azurerm_storage_account.storage.name}"
    storage_account_endpoint = "${azurerm_storage_account.storage.primary_blob_endpoint}"

    # Firewall
    nsg_id = "${list(azurerm_network_security_group.nsg.*.id)}"
  }
}
