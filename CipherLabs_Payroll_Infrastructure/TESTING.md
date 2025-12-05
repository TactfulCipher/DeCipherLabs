# DeCipherLabs Payroll Infrastructure - Tests

## Running Tests

To run the tests, you'll need to install Foundry:

```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

Then run the tests:

```bash
# Run all tests
forge test

# Run tests with verbose output
forge test -v

# Run a specific test
forge test --match-test testName

# Check coverage
forge coverage
```

## Test Files

- `test/DeCipherLabsPayroll.t.sol` - Tests for the main payroll contract
- `test/DeCipherLabsPayrollFactory.t.sol` - Tests for the factory contract
- `test/HedgeVaultManager.t.sol` - Tests for the hedge vault manager
- `test/IntegrationTest.t.sol` - End-to-end integration tests

## Key Features Tested

1. **Force Payment Bypass**: Tests that `forceProcessPayment` bypasses time checks
2. **Multiple Frequencies**: Tests HOURLY, DAILY, WEEKLY, MINUTELY frequencies
3. **Native ETH Support**: Tests ETH deposits with fee calculation
4. **Hedge Vault Integration**: Tests the volatility management feature
5. **Salary Advances**: Tests the advance authorization and repayment system
6. **Token Handling**: Tests ERC-20 and native token payments
7. **Fee Calculation**: Tests the 1% service fee mechanism