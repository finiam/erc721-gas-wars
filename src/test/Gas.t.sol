// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import { DSTestPlus } from "./utils/DSTestPlus.sol";

import { MockERC721 } from "@solmate/test/utils/mocks/MockERC721.sol";
import { ERC721User } from "./utils/users/ERC721User.sol";
import { ERC1155User } from "./utils/users/ERC1155User.sol";

import { ERC1155TokenReceiver } from "@solmate/tokens/ERC1155.sol";
import { ERC721TokenReceiver } from "@solmate/tokens/ERC721.sol";
import { ERC1155Recipient } from "@solmate/test/ERC1155.t.sol";
import { ERC721Recipient } from "@solmate/test/ERC721.t.sol";

import { Azuki } from "../Azuki.sol";
import { Blimpie } from "../Blimpie.sol";
import { ElevenFiftyFiveD } from "../1155D.sol";
import { Solmate } from "../Solmate.sol";
import { GeneticChain } from "../GeneticChain.sol";
import { MasonChance } from "../MasonChance.sol";
import { OZ } from "../OZ.sol";
import { Tiny } from "../Tiny.sol";
import { Manifold } from "../Manifold.sol";

// The safeMint int is for quantity not tokenId
contract AzukiTest is DSTestPlus {
  Azuki token;

  function setUp() public {
    token = new Azuki();
  }

  function testSafeMintToERC721Recipient() public {
    ERC721Recipient to = new ERC721Recipient();

    token.safeMint(address(to), 1);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 0);
    assertBytesEq(to.data(), "");
  }

  function testMintMany() public {
    ERC721Recipient to = new ERC721Recipient();

    token.mintMany(address(to), 10000);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 10000);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 9999);
    assertBytesEq(to.data(), "");
  }

  function testTransferFrom() public {
    address contractAddress = address(token);
    ERC721User from = new ERC721User(contractAddress);

    token.safeMint(address(from), 1);

    from.approve(address(this), 0);

    token.transferFrom(address(from), address(0xBEEF), 0);

    assertEq(token.ownerOf(0), address(0xBEEF));
    assertEq(token.balanceOf(address(0xBEEF)), 1);
    assertEq(token.balanceOf(address(from)), 0);
  }
}

// The safeMint int is for tokenId
// On blimpies if you mint some token bigger then what currently exists
//the owner will be identify by the current id for example
// if the fist token to be minted is with id == 1
// then to query the owner you need to do ownerOf(0)
// because the owners are inserted in to an array
contract BlimpieTest is DSTestPlus {
  Blimpie token;

  function setUp() public {
    token = new Blimpie();
  }

  function testSafeMintToERC721Recipient() public {
    ERC721Recipient to = new ERC721Recipient();

    token.safeMint(address(to), 0);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 0);
    assertBytesEq(to.data(), "");
  }

  function testMintMany() public {
    ERC721Recipient to = new ERC721Recipient();

    token.mintMany(address(to), 10000);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 10000);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 9999);
    assertBytesEq(to.data(), "");
  }

  function testTransferFrom() public {
    address contractAddress = address(token);
    ERC721User from = new ERC721User(contractAddress);

    token.safeMint(address(from), 0);

    from.approve(address(this), 0);

    token.transferFrom(address(from), address(0xBEEF), 0);

    assertEq(token.ownerOf(0), address(0xBEEF));
    assertEq(token.balanceOf(address(0xBEEF)), 1);
    assertEq(token.balanceOf(address(from)), 0);
  }
}

contract SolmateTest is DSTestPlus {
  Solmate token;

  function setUp() public {
    token = new Solmate();
  }

  function testSafeMintToERC721Recipient() public {
    ERC721Recipient to = new ERC721Recipient();

    token.safeMint(address(to), 0);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 0);
    assertBytesEq(to.data(), "");
  }

  function testMintMany() public {
    ERC721Recipient to = new ERC721Recipient();

    token.mintMany(address(to), 10000);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 10000);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 9999);
    assertBytesEq(to.data(), "");
  }

  function testTransferFrom() public {
    address contractAddress = address(token);
    ERC721User from = new ERC721User(contractAddress);

    token.safeMint(address(from), 0);

    from.approve(address(this), 0);

    token.transferFrom(address(from), address(0xBEEF), 0);

    assertEq(token.ownerOf(0), address(0xBEEF));
    assertEq(token.balanceOf(address(0xBEEF)), 1);
    assertEq(token.balanceOf(address(from)), 0);
  }
}

// The safeMint doesn't receive an int just address
contract GeneticChainTest is DSTestPlus {
  GeneticChain token;

  function setUp() public {
    token = new GeneticChain();
  }

  function testSafeMintToERC721Recipient() public {
    ERC721Recipient to = new ERC721Recipient();

    token.safeMint(address(to));

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 0);
    assertBytesEq(to.data(), "");
  }

  function testMintMany() public {
    ERC721Recipient to = new ERC721Recipient();

    token.mintMany(address(to), 10000);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 10000);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 9999);
    assertBytesEq(to.data(), "");
  }

  function testTransferFrom() public {
    address contractAddress = address(token);
    ERC721User from = new ERC721User(contractAddress);

    token.safeMint(address(from));

    from.approve(address(this), 0);

    token.transferFrom(address(from), address(0xBEEF), 0);

    assertEq(token.ownerOf(0), address(0xBEEF));
    assertEq(token.balanceOf(address(0xBEEF)), 1);
    assertEq(token.balanceOf(address(from)), 0);
  }
}

contract MasonChanceTest is DSTestPlus {
  Solmate token;

  function setUp() public {
    token = new Solmate();
  }

  function testSafeMintToERC721Recipient() public {
    ERC721Recipient to = new ERC721Recipient();

    token.safeMint(address(to), 0);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 0);
    assertBytesEq(to.data(), "");
  }

  function testMintMany() public {
    ERC721Recipient to = new ERC721Recipient();

    token.mintMany(address(to), 10000);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 10000);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 9999);
    assertBytesEq(to.data(), "");
  }

  function testTransferFrom() public {
    address contractAddress = address(token);
    ERC721User from = new ERC721User(contractAddress);

    token.safeMint(address(from), 0);

    from.approve(address(this), 0);

    token.transferFrom(address(from), address(0xBEEF), 0);

    assertEq(token.ownerOf(0), address(0xBEEF));
    assertEq(token.balanceOf(address(0xBEEF)), 1);
    assertEq(token.balanceOf(address(from)), 0);
  }
}

contract OZTest is DSTestPlus {
  OZ token;

  function setUp() public {
    token = new OZ();
  }

  function testSafeMintToERC721Recipient() public {
    ERC721Recipient to = new ERC721Recipient();

    token.safeMint(address(to), 0);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 0);
    assertBytesEq(to.data(), "");
  }

  function testMintMany() public {
    ERC721Recipient to = new ERC721Recipient();

    token.mintMany(address(to), 10000);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 10000);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 9999);
    assertBytesEq(to.data(), "");
  }

  function testTransferFrom() public {
    address contractAddress = address(token);
    ERC721User from = new ERC721User(contractAddress);

    token.safeMint(address(from), 0);

    from.approve(address(this), 0);

    token.transferFrom(address(from), address(0xBEEF), 0);

    assertEq(token.ownerOf(0), address(0xBEEF));
    assertEq(token.balanceOf(address(0xBEEF)), 1);
    assertEq(token.balanceOf(address(from)), 0);
  }
}

contract TinyTest is DSTestPlus {
  Tiny token;

  function setUp() public {
    token = new Tiny();
    token.updateFeatures(token.FEATURE_TRANSFERS());
    token.updateFeatures(token.FEATURE_TRANSFERS_ON_BEHALF());
  }

  function testSafeMintToERC721Recipient() public {
    ERC721Recipient to = new ERC721Recipient();

    token.safeMint(address(to), 0);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 0);
    assertBytesEq(to.data(), "");
  }

  function testMintMany() public {
    ERC721Recipient to = new ERC721Recipient();

    token.mintMany(address(to), 10000);

    assertEq(token.ownerOf(0), address(to));
    assertEq(token.balanceOf(address(to)), 10000);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 9999);
    assertBytesEq(to.data(), "");
  }

  function testTransferFrom() public {
    address contractAddress = address(token);
    ERC721User from = new ERC721User(contractAddress);

    token.safeMint(address(from), 0);

    from.approve(address(this), 0);

    token.transferFrom(address(from), address(0xBEEF), 0);

    assertEq(token.ownerOf(0), address(0xBEEF));
    assertEq(token.balanceOf(address(0xBEEF)), 1);
    assertEq(token.balanceOf(address(from)), 0);
  }
}

contract ManifoldTest is DSTestPlus {
  Manifold token;

  function setUp() public {
    token = new Manifold();
  }

  function testSafeMintToERC721Recipient() public {
    ERC721Recipient to = new ERC721Recipient();

    token.safeMint(address(to));

    assertEq(token.ownerOf(1), address(to));
    assertEq(token.balanceOf(address(to)), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 1);
    assertBytesEq(to.data(), "");
  }

  function testMintMany() public {
    ERC721Recipient to = new ERC721Recipient();

    token.mintMany(address(to), 10000);

    assertEq(token.ownerOf(10000), address(to));
    assertEq(token.balanceOf(address(to)), 10000);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 10000);
    assertBytesEq(to.data(), "");
  }

  function testTransferFrom() public {
    address contractAddress = address(token);
    ERC721User from = new ERC721User(contractAddress);

    token.safeMint(address(from));

    from.approve(address(this), 1);

    token.transferFrom(address(from), address(0xBEEF), 1);

    assertEq(token.ownerOf(1), address(0xBEEF));
    assertEq(token.balanceOf(address(0xBEEF)), 1);
    assertEq(token.balanceOf(address(from)), 0);
  }
}

contract ElevenFiftyFiveDTest is DSTestPlus {
  ElevenFiftyFiveD token;

  function setUp() public {
    token = new ElevenFiftyFiveD("test");
  }

  function testSafeMintToERC721Recipient() public {
    ERC1155Recipient to = new ERC1155Recipient();

    token.safeMint(address(to));

    assertEq(token.balanceOf(address(to), 0), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 0);
  }

  function testMintMany() public {
    ERC1155Recipient to = new ERC1155Recipient();

    token.mintMany(address(to), 10000);

    assertEq(token.balanceOf(address(to), 0), 1);

    assertEq(to.operator(), address(this));
    assertEq(to.from(), address(0));
    assertEq(to.id(), 9999);
  }

  function testTransferFrom() public {
    address contractAddress = address(token);
    ERC1155User from = new ERC1155User(contractAddress);

    token.safeMint(address(from));

    from.setApprovalForAll(address(this), true);

    token.safeTransferFrom(address(from), address(0xBEEF), 0, 1, "");

    assertEq(token.balanceOf(address(0xBEEF), 0), 1);
  }
}
