# Após realizar os testes com o provider local, iremos realizar a criação da infraestrutura proposta na apresentação. Para isso será utilizado a Digital Ocean.


# É possível criar uma conta na Digital Ocean e conseguir até $200,00 para realizar testes.
# O cadastro para ganhar o vaucher pode ser realizado no link: https://try.digitalocean.com/freetrialoffer/


# Após a criação da conta, acesse a documentação do provider da Digital Ocean para realizar a criação do ambiente.
# https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs


# Antes de iniciar os arquivos de configuração, iremos criar uma chave para conexão SSH com os servidores. Para isso, siga os passos abaixo:

# Digite o comando abaixo para criação da chave SSH. Ignore a "passphrase" caso deseje e defina o diretório que será criado a chave, quando solicitado. 
# Caso deseje salvar a chave no diretório atual, utilize o comando "./nome_chave"

ssh-keygen -t rsa -b 2048