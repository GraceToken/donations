Each donation on Grace is a smart contract on Ethereum. This repository contains the smart contracts used on the platform.

- `DonationPool.sol`: Contract with GRCE tokens locked up until the specified time. It pools donations together to save costs on gas.

TODO
--------------------

- Write and run tests on the Ropsten testnet.

- Integration with web platform.

- Security audit for contracts.

- Custom condition for fund release: The donor can specify conditions for fund release, which is to be approved by the donor.

- Staged release of funds: multiple custom conditions in a donation.

- Custom condition for fund release in a donation pool.

- Currency conversion: converting USD, BTC, ETH into GRCE and vice versa.
