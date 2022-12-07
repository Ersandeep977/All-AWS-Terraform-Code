#Time 30 sec sleep
resource "time_sleep" "wait_30_seconds" {
  create_duration = "30s"
}

# Store key in local system
resource "local_file" "TF_Key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "terraform_key.pem"
}



