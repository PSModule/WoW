#Force the Invoke-RestMethod PowerShell cmdlet to use TLS 1.2
#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls13
