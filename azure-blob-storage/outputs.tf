output "blob_url" {
  description = "url of blob storage"
  value       = try(azurem_storage_blob.klaudias.url, "")
}