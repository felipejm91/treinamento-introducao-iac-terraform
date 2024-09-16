# Agora será criado outros 3 novos arquivos
# Para isso, siga os passos abaixo:
# - copie o primeiro bloco de "resource" e crie os outros blocos, alterando os nomes de "resourse" e "filename"
# - execute o comando "terraform plan" e depois "terraform apply"

resource "local_file" "arquivo1" {
  content  = "Hello World!"
  filename = "./arquivo1"
}

resource "local_file" "arquivo2" {
  content  = "Hello World!"
  filename = "./arquivo2"
}

resource "local_file" "arquivo3" {
  content  = "Hello World!"
  filename = "./arquivo3"
}

resource "local_file" "arquivo4" {
  content  = "Hello World!"
  filename = "./arquivo4"
}
