module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8546,
      from: '0x771879e709c7f3498de35a52c83dd964f3870e01',
      network_id: "*" // Match any network id
    },
    ropsten: {
      host: "localhost",
      port: 8545,
      network_id: 3
    }
  }
};
