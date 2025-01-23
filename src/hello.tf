# Opção 1: Usando null_resource com local-exec
resource "null_resource" "hello" {
  provisioner "local-exec" {
    command = "echo 'Hello World!'"
  }
}

# Opção 2: Usando output
output "mensagem" {
  value = "Hello World!"
}