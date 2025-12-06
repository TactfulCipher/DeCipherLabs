# 🚀 Deployment & Verification Guide

## Prerequisites

1. **Environment Variables**
   Create a `.env` file in the project root:
   ```bash
   # Base Sepolia Testnet
   BASE_SEPOLIA_RPC_URL=https://sepolia.base.org
   
   # Or Base Mainnet
   BASE_MAINNET_RPC_URL=https://mainnet.base.org
   
   # Your deployer private key
   PRIVATE_KEY=your_private_key_here
   
   # BaseScan API Key (get from https://basescan.org/myapikey)
   BASESCAN_API_KEY=your_basescan_api_key_here
   ```

2. **Load Environment Variables**
   ```bash
   source .env
   ```

---

## Deployment Commands

### **Option 1: Deploy with Automatic Verification (Recommended)**

```bash
# Deploy to Base Sepolia Testnet
forge script script/DeployWithMocks.s.sol:DeployDeCipherLabsWithMocks \
  --rpc-url $BASE_SEPOLIA_RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast \
  --verify \
  --etherscan-api-key $BASESCAN_API_KEY \
  -vvvv
```

```bash
# Deploy to Base Mainnet
forge script script/DeployWithMocks.s.sol:DeployDeCipherLabsWithMocks \
  --rpc-url $BASE_MAINNET_RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast \
  --verify \
  --etherscan-api-key $BASESCAN_API_KEY \
  -vvvv
```

---

### **Option 2: Deploy First, Verify Later**

#### Step 1: Deploy
```bash
forge script script/DeployWithMocks.s.sol:DeployDeCipherLabsWithMocks \
  --rpc-url $BASE_SEPOLIA_RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast \
  -vvvv
```

#### Step 2: Verify Each Contract
After deployment, note the contract addresses from the logs, then verify:

```bash
# Verify MockStablecoin
forge verify-contract \
  <STABLECOIN_ADDRESS> \
  src/MockStablecoin.sol:MockStablecoin \
  --chain-id 84532 \
  --etherscan-api-key $BASESCAN_API_KEY

# Verify MockVolatileToken
forge verify-contract \
  <VOLATILE_TOKEN_ADDRESS> \
  src/MockVolatileToken.sol:MockVolatileToken \
  --chain-id 84532 \
  --etherscan-api-key $BASESCAN_API_KEY

# Verify MockSwapRouter
forge verify-contract \
  <SWAP_ROUTER_ADDRESS> \
  src/MockSwapRouter.sol:MockSwapRouter \
  --chain-id 84532 \
  --etherscan-api-key $BASESCAN_API_KEY

# Verify HedgeVaultManager
forge verify-contract \
  <HEDGE_VAULT_ADDRESS> \
  src/HedgeVaultManager.sol:HedgeVaultManager \
  --chain-id 84532 \
  --etherscan-api-key $BASESCAN_API_KEY

# Verify PayrollFactory
forge verify-contract \
  <FACTORY_ADDRESS> \
  src/DeCipherLabsPayrollFactory.sol:DeCipherLabsPayrollFactory \
  --chain-id 84532 \
  --etherscan-api-key $BASESCAN_API_KEY

# Verify TokenFaucet
forge verify-contract \
  <FAUCET_ADDRESS> \
  src/MockTokenFaucet.sol:MockTokenFaucet \
  --chain-id 84532 \
  --etherscan-api-key $BASESCAN_API_KEY \
  --constructor-args $(cast abi-encode "constructor(address,address)" <STABLE_ADDRESS> <VOLATILE_ADDRESS>)
```

---

## Chain IDs

| Network | Chain ID |
|---------|----------|
| Base Sepolia (Testnet) | 84532 |
| Base Mainnet | 8453 |

---

## After Deployment

### 1. **Save Contract Addresses**
The deployment script will output all contract addresses. Save them:

```
Mock stablecoin deployed at: 0x...
Mock volatile token deployed at: 0x...
Mock swap router deployed at: 0x...
Hedge vault manager deployed at: 0x...
Payroll factory deployed at: 0x...
Token Faucet deployed at: 0x...
```

### 2. **Update Frontend**
Update `decipherlabs-frontend/src/utils/faucet.js`:
```javascript
export const FAUCET_ADDRESS = '0xYOUR_FAUCET_ADDRESS';
```

Update other contract addresses in your frontend config files.

### 3. **Verify on BaseScan**
Visit BaseScan to see your verified contracts:
- **Testnet:** https://sepolia.basescan.org/address/YOUR_CONTRACT_ADDRESS
- **Mainnet:** https://basescan.org/address/YOUR_CONTRACT_ADDRESS

---

## Troubleshooting

### **Verification Failed?**

If automatic verification fails, you can retry:

```bash
# Get the deployment transaction hash from the logs
forge verify-contract \
  <CONTRACT_ADDRESS> \
  <CONTRACT_PATH>:<CONTRACT_NAME> \
  --chain-id <CHAIN_ID> \
  --etherscan-api-key $BASESCAN_API_KEY \
  --watch
```

### **Constructor Arguments**

For contracts with constructor arguments (like MockTokenFaucet), encode them:

```bash
# Example for MockTokenFaucet
cast abi-encode "constructor(address,address)" \
  0xSTABLE_TOKEN_ADDRESS \
  0xVOLATILE_TOKEN_ADDRESS
```

---

## Testing Deployment

After deployment, test the contracts:

```bash
# 1. Check faucet balance
cast call <FAUCET_ADDRESS> "getFaucetBalance()(uint256,uint256)" \
  --rpc-url $BASE_SEPOLIA_RPC_URL

# 2. Claim tokens from faucet
cast send <FAUCET_ADDRESS> "claimTokens()" \
  --rpc-url $BASE_SEPOLIA_RPC_URL \
  --private-key $PRIVATE_KEY

# 3. Check your token balance
cast call <STABLE_TOKEN_ADDRESS> "balanceOf(address)(uint256)" \
  <YOUR_ADDRESS> \
  --rpc-url $BASE_SEPOLIA_RPC_URL
```

---

## Summary

✅ All 40 tests passing  
✅ Ready for deployment  
✅ Verification guide provided  
✅ Frontend integration ready  

**You're all set to deploy to Base!** 🚀

---

## Quick Deploy Command

```bash
# One-line deploy with verification
forge script script/DeployWithMocks.s.sol:DeployDeCipherLabsWithMocks \
  --rpc-url $BASE_SEPOLIA_RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast \
  --verify \
  --etherscan-api-key $BASESCAN_API_KEY \
  -vvvv
```

After deployment, update the faucet address in your frontend and you're live! 🎉
