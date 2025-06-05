# 🖥️ Verificador de Sistema Operacional via IP (PowerShell)

Este script PowerShell realiza o seguinte:

- Pinga uma lista de IPs para verificar se os hosts estão online
- Conecta via WMI aos hosts que responderem
- Coleta informações do sistema operacional (nome da máquina, build e versão)
- Determina se o sistema é **Windows 10**, **Windows 11** ou uma **versão desconhecida**
- Exibe os resultados em uma interface gráfica (`Out-GridView`)

## 📋 Pré-requisitos

- PowerShell (recomendado: 5.1 ou superior)
- Permissões de rede para acessar os hosts via WMI
- O serviço **WMI (Winmgmt)** ativo nas máquinas remotas

## 🚀 Como usar

1. Abra o PowerShell como Administrador.
2. Cole ou salve o script em um arquivo, por exemplo: `verificadorSO.ps1`
3. Execute o script:
   ```powershell
   .\verificadorSO.ps1
