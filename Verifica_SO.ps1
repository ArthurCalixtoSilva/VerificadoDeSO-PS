# Lista de IPs
$ips = @(
    "172.16.2.111", "172.16.2.118", "172.16.2.126" # etc...
)

function Get-WindowsVersion {
    param([string]$BuildNumber)
    switch ($BuildNumber) {
        {$_ -ge 22000} { return "Windows 11" }
        {$_ -ge 10240 -and $_ -lt 22000} { return "Windows 10" }
        default { return "Versão desconhecida" }
    }
}

$resultados = @()

foreach ($ip in $ips) {
    Write-Host "`n🔍 Pingando $ip ..."
    $ping = Test-Connection -ComputerName $ip -Count 3 -Quiet

    if ($ping) {
        Write-Host "✅ Host está online. Obtendo informações do sistema..."

        try {
            $os = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $ip -ErrorAction Stop
            $version = $os.Version
            $build = $os.BuildNumber
            $so = Get-WindowsVersion -BuildNumber $build
            $hostname = $os.CSName

            $resultados += [PSCustomObject]@{
                Nome    = $hostname
                IP      = $ip
                Sistema = $so
                Status  = "Online"
            }
        } catch {
            # Ignora erros de WMI
        }
    }
}

# Filtra apenas os que funcionaram
$resultados | Select-Object Nome, IP, Sistema | Out-GridView -Title "Hosts Online com Sistema Operacional"
