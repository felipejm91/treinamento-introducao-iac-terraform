# Iremos iniciar nossos testes realizando a criação de arquivos locais.

# Todo projeto Terraform precisa conter o arquivo "main.tf" em seu diretório. 

# Para início do laboratório, foi criado um arquivo local utilizando o "Provider Local"
# O provider local pode ser consultado na documentação abaixo:
# https://registry.terraform.io/providers/hashicorp/local/latest/docs


resource "local_file" "arquivo" {
  content  = "Hello World!"
  filename = "./arquivo"
}


# Após criação do arquivo "main.tf" e configuração do bloco de "resource", podemos executar os comandos abaixo para executar o projeto:

# 1 - O comando "terraform init" inicializa o projeto terraform. Será inicializado o Terraform e será criado alguns arquivos do próprio Terraform

# 2 - O comando "terraform fmt" formata o arquivo ".tf" para que fique alinhado e organizado

# 3 - O comando "terraform plan" realiza o planejamento da infraestrutura que será criada, destruída ou modificada.

# 4 - O comando "terraform apply" irá aplicar o planejamento realizado. Caso esteja de acordo com o que será executado, digite "yes" no console quando for solicitado.

# 5 - O comando "terraform destroy" irá destruir a infraestrutura que foi declarada nos arquivos de configuração.

# Conforme for realizando a configuração da infraestrutura, será criado um arquivo chamado "terraform.tfstate" que armazena o estado atual do Terraform.
# Esse arquivo deve ser guardado em segurança, pois sem ele o Terraform irá entender que você está criando uma nova infraestrutura ao invés de apenas atualizar a existente.