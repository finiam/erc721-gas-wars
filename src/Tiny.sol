// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./TinyErc721.sol";

contract Tiny is TinyERC721 {
  uint256 public supply;

  uint256 public constant override TOKEN_UID = 0xd9b5d3b66c60255ffa16c57c0f1b2db387997fa02af673da5767f1acb0f345af;

  constructor() TinyERC721("MyToken", "MTK") {}

  function mintMany(address _to, uint256 _qty) public {
    for (uint256 i = 0; i < _qty; i++) {
      safeMint(_to, supply, "");
      supply++;
    }
  }
}
