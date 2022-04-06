# Foundry expectEmit Bug

Repo to reproduce the `expectEmit` bug I ran into while writing tests with Foundry.

## Tests

### testEmitMyEvent_v1

Works, as expected.

### testEmitMyEvent_v2

Fails, but should work.

## Environment

- [ds-test@0a5da5](https://github.com/dapphub/ds-test/tree/0a5da56b0d65960e6a994d2ec8245e6edd38c248)
- forge v0.2.0 (6130af7 2022-04-06T00:04:11.858449+00:00)
- solidity v0.8.13+commit.abaa5c0e