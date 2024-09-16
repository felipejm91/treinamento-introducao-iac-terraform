# O arquivo anterior pode ser melhorado para deixa-lo reutilizável e mais bem organizado. Para isso iremos, podemos utilizar variáveis.
# Crie o bloco de resource da seguinte maneira para utilizar variáveis.

resource "local_file" "arquivo" {
  count    = 3 # declara a quantidade de recusros do mesmo tipo que será criada.
  content  = "Hello World"
  filename = "./${var.nome_arquivo}-${count.index}" # utiliza o index do "count" para nomear o arquivo
}

variable "nome_arquivo" {
  default     = "terraformFile"                            # Valor default que será utilizado para a variável. Obrigatório
  type        = string                                     # Tipo da variável. Opcional
  description = "Nome que será utilizado para os arquivos" # Descrição da variável para documentação. Opcional
}