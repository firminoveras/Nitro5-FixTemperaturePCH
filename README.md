# 🌀 Acer Nitro 5 Fan Fix

Este projeto é um script em **Python** que permite regular a velocidade das ventoinhas do **Acer Nitro 5** com base na temperatura, utilizando o [nbfc-linux](https://github.com/nbfc-linux/nbfc-linux).  

O objetivo principal é **reduzir o ruído** das ventoinhas sem comprometer o resfriamento do sistema. Isso é feito ao manipular os registros corretos e escrever valores de temperatura falsos, permitindo um controle mais eficiente da rotação das fans.

## 📌 Requisitos

Para utilizar este script, é necessário ter o **yay** instalado, pois ele será usado para gerenciar a instalação do `nbfc-linux`.  

📌 **Sistema testado:** Este script foi testado apenas no **Arch Linux**, mas pode funcionar em outras distribuições baseadas no Arch.  
🚀 **Observação:** O uso em outras distribuições pode exigir adaptações.

## 🚀 Como Usar

Para instalar o script e criar o serviço que rodará em segundo plano, basta rodar o script `setup.sh` no terminal:

```bash
./setup.sh
```
A execução do script irá instalar as dependências e mover o script e o serviço para as pastas corretas, bem como iniciar o serviço sempre que o computador é ligado.

## ⚙️ Configuração

Este script utiliza o módulo **ec_probe** do `nbfc-linux` para **ler e escrever** no registro responsável pela temperatura do **PCH** (Platform Controller Hub) do computador.  

Caso o registro de temperatura do **PCH** no seu sistema utilize um endereço diferente, será necessário modificar o arquivo `pch_temp.py`.  

Dentro desse arquivo, há uma linha específica que realiza a leitura do valor do registro:

```python
output = int(run_command('sudo ec_probe read 179 | egrep -o "[0-9]+" | head -1'))
```
O número *179* representa o endereço do registro de temperatura do PCH. Se o seu computador utilizar um endereço diferente, será necessário alterá-lo para o valor correto.

### 🔍 Como encontrar o registro correto?
Para verificar qual é o registro de temperatura do PCH no seu sistema, execute o seguinte comando no terminal:
```bash
sudo ec_probe dump
```
Isso exibirá todos os registros disponíveis. Localize aquele que corresponde à temperatura do PCH e substitua o número 179 no arquivo pch_temp.py pelo valor correto.

Após realizar a modificação, o script estará configurado corretamente para o seu sistema e reinstale, caso necessário.
