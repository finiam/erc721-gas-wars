// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./ERC721K.sol";

contract K is ERC721K {
  constructor() ERC721K("MyToken", "MTK") {}

  function tokenURI(uint256) public pure virtual override returns (string memory) {}

  function safeMint(address to, uint256 qty) public {
    _safeMint(to, qty);
  }

  function mintMany(address to, uint256 qty) public {
    _safeMint(to, qty);
  }
}
