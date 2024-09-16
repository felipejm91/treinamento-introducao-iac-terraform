# Declaração das variáveis

variable "do_token" {
  default     = ""
  type        = string
  description = "API token de conexão com a Digital Ocean"
}

variable "imagem" {
  default     = ""
  type        = string
  description = "Imagem do SO que será utilizado nos servidores"
}

variable "regiao" {
  default     = ""
  type        = string
  description = "Região que será criado o recurso"
}

variable "size" {
  default     = ""
  type        = string
  description = "Tamanho dos servidores"
}

variable "chave_ssh" {
  default = ""
}