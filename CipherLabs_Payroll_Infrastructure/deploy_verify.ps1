param(
    [Parameter(Mandatory=$true)]
    [string]$PrivateKey,
    
    [Parameter(Mandatory=$true)]
    [string]$BaseScanApiKey,

    [string]$RpcUrl = "https://sepolia.base.org"
)

$env:ETHERSCAN_API_KEY = $BaseScanApiKey

Write-Host "🚀 Deploying and Verifying DeCipherLabs Payroll Contracts..."
Write-Host "Network: Base Sepolia ($RpcUrl)"

forge script script/DeployWithMocks.s.sol:DeployDeCipherLabsWithMocks `
  --rpc-url $RpcUrl `
  --private-key $PrivateKey `
  --broadcast `
  --verify `
  --etherscan-api-key $BaseScanApiKey `
  -vvvv

Write-Host "✅ Deployment Complete!"
