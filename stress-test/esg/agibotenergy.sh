# zeh sobrinho,28 dezembro 23, booora entrar na sp 42...c & bash pré requisito porra \o/
#!/bin/bash

# Comando para obter informações da CPU
cpu_info=$(lscpu | grep "Model name" | awk -F ':' '{print $2}' | sed 's/^ *//')
cpu_cores=$(lscpu | grep "Core(s) per socket" | awk '{print $4}' | sed 's/^ *//')
cpu_freq=$(lscpu | grep "CPU MHz" | awk '{print $3}' | sed 's/^ *//')

# Comando para obter informações de memória
mem_info=$(free -h | grep "Mem" | awk '{print "Total: "$2", Used: "$3", Free: "$4}' | sed 's/^ *//')

# Comando para obter informações de armazenamento
storage_info=$(df -h | grep "/dev/sda1" | awk '{print "Total: "$2", Used: "$3", Free: "$4}' | sed 's/^ *//')

# Comando para obter informações da GPU (supondo NVIDIA)
gpu_info=$(nvidia-smi --query-gpu=name,temperature.gpu,power.draw --format=csv,noheader | sed 's/^ *//')

# Comando para obter informações da TPU (exemplo, pode não funcionar em todos os sistemas)
tpu_info=$(echo "TPU Info: N/A")  # Adapte conforme necessário

# Informações de temperatura da CPU (pode variar dependendo do sistema)
cpu_temp=$(sensors | grep "Core 0" | awk '{print $3}')

# Informações de uso da rede
network_info=$(ifconfig | grep "RX packets" | awk '{print "RX: "$2", TX: "$6}')

# Exibindo as informações formatadas em uma tabela
echo "-------------------------------------------------------------------------"
echo "|                      Sistema Informações                              |"
echo "-------------------------------------------------------------------------"
echo "| CPU:      | $cpu_info"
echo "| Núcleos por CPU: | $cpu_cores"
echo "| Frequência da CPU: | $cpu_freq MHz"
echo "| Temperatura da CPU: | $cpu_temp"
echo "| Memória:    | $mem_info"
echo "| Armazenamento: | $storage_info"
echo "| GPU:      | $gpu_info"
echo "| TPU:      | $tpu_info"
echo "| Uso de Rede: | $network_info"
echo "-------------------------------------------------------------------------"
