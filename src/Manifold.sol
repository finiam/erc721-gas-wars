// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@manifoldxyz/creator-core-solidity/contracts/ERC721Creator.sol";

contract Manifold is ERC721Creator {
  uint256 supply;

  constructor() ERC721Creator("MyToken", "MTK") {}

  function safeMint(address to) public {
    mintBase(to);
  }

  function mintMany(address _to, uint256 _qty) public {
    for (uint256 i = 0; i < _qty; i++) {
      mintBase(_to);
      supply++;
    }
  }
}
