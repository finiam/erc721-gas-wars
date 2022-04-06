
# ERC721 Gas wars • [![tests](https://github.com/finiam/contracts-template/actions/workflows/tests.yml/badge.svg)](https://github.com/finiam/contracts-template/actions/workflows/tests.yml) [![lints](https://github.com/finiam/contracts-template/actions/workflows/lints.yml/badge.svg)](https://github.com/finiam/contracts-template/actions/workflows/lints.yml)

Testing out optimized 721 implementations and their gas costs !

Inspired by this awesome [repository](https://github.com/nftchef/erc721-gas-compare)

Currently we have:

1. OpenZeppelin standard
2. ERC721B (Blimpie. by Squeebo aka erc721 slim)
3. ERC721Sequencial by papaver (Genetic chain implementation)
4. Nuclear Nerds ERC721 (Mason/Chance)
5. Azuki ERC721A
6. ERC1155D (erc721-like implementation)
7. Solmate
8. TinyERC721 (AiPersonalityERC721)

## Getting Started

```sh

git clone git@github.com:finiam/erc721-gas-wars.git
&& cd erc721-gas-wars.git
&& git submodule update --init --recursive
```

## Install

You have **2** options , `Nix` or system dependencies with `asdf`.

We recomend you have `direnv` installed for both of them

### Nix

We have a flake file.

Add `experimental-features = nix-command flakes` to your `~/.config/nix/nix.conf`

And uncomment the `use flake` line on your `.envrc`

All the dependencies should be installed for you by nix

### Sytem dependencies

If you need to install and read about forgery please [go to](https://onbjerg.github.io/foundry-book/)

You need `node 16` and `yarn`

You can use [asdf](https://github.com/asdf-vm/asdf) and run `asdf install`


## Gas report

AzukiTest:testMintMany() (gas: 50742021)

AzukiTest:testSafeMintToERC721Recipient() (gas: 361250)

AzukiTest:testTransferFrom() (gas: 505992)

BlimpieTest:testMintMany() (gas: 286403908)

BlimpieTest:testSafeMintToERC721Recipient() (gas: 338210)

BlimpieTest:testTransferFrom() (gas: 459380)

ElevenFiftyFiveDTest:testMintMany() (gas: 296936107)

ElevenFiftyFiveDTest:testSafeMintToERC721Recipient() (gas: 531217)

ElevenFiftyFiveDTest:testTransferFrom() (gas: 551653)

GeneticChainTest:testMintMany() (gas: 281102498)

GeneticChainTest:testSafeMintToERC721Recipient() (gas: 338486)

GeneticChainTest:testTransferFrom() (gas: 462112)

ManifoldTest:testMintMany() (gas: 521578683)

ManifoldTest:testSafeMintToERC721Recipient() (gas: 409407)

ManifoldTest:testTransferFrom() (gas: 514427)

MasonChanceTest:testMintMany() (gas: 277997374)

MasonChanceTest:testSafeMintToERC721Recipient() (gas: 337139)

MasonChanceTest:testTransferFrom() (gas: 457545)

OZTest:testMintMany() (gas: 284013814)

OZTest:testSafeMintToERC721Recipient() (gas: 337855)

OZTest:testTransferFrom() (gas: 462164)

SolmateTest:testMintMany() (gas: 277997374)

SolmateTest:testSafeMintToERC721Recipient() (gas: 337139)

SolmateTest:testTransferFrom() (gas: 457545)

TinyTest:testMintMany() (gas: 351492825)

TinyTest:testSafeMintToERC721Recipient() (gas: 367049)

TinyTest:testTransferFrom() (gas: 494610)

