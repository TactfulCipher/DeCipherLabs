# Batch Processing Confirmation

## Current Behavior
The "Process All Payments Now" feature in the DeCipherLabs Payroll Dashboard currently operates as a **Client-Side Batch**.

- **Mechanism**: The frontend iterates through the list of active employees and triggers a `forceProcessPayment` transaction for each one sequentially.
- **Wallet Interaction**: The user must manually approve **one transaction per employee**.
  - Example: If there are 5 employees, MetaMask (or your wallet) will pop up 5 times.
- **Reasoning**: The current Smart Contract (`DeCipherLabsPayroll.sol`) does not implement a native `batchProcessPayments` function that takes an array of addresses. This was a design decision for the MVP to keep the contract simple and avoid complex array iteration gas limits within a single block.

## Future Improvement
To enable single-transaction batch processing:
1.  **Smart Contract Update**: Add a `processBatchPayments(address[] calldata employees)` function to `DeCipherLabsPayroll.sol`.
2.  **Redeployment**: This would require a newly deployed contract address.
3.  **Frontend Update**: Update `handleProcessAllPayments` to call this new function instead of looping.

## Summary for Testing
- **Is it atomic?** No. If transaction 3 fails, transactions 1 and 2 remain valid.
- **Is it one click?** No, it is one click to *start*, but multiple clicks to *confirm* in the wallet.
