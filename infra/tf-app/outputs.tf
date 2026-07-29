# infra/tf-app/outputs.tf

output "resource_group_name" {
  value = azurerm_resource_group.app.name
}