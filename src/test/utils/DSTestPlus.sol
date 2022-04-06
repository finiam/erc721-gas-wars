// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import { XConsole } from "./Console.sol";

import { DSTest } from "@ds/test.sol";
import { ERC20 } from "@solmate/tokens/ERC20.sol";

import { stdCheats, stdError } from "@std/stdlib.sol";
import { Vm } from "@std/Vm.sol";

contract DSTestPlus is DSTest, stdCheats {
  XConsole console = new XConsole();

  /// @dev Use forge-std Vm logic
  Vm public constant vm = Vm(HEVM_ADDRESS);

  function assertBytesEq(bytes memory a, bytes memory b) internal virtual {
    if (keccak256(a) != keccak256(b)) {
      emit log("Error: a == b not satisfied [bytes]");
      emit log_named_bytes("  Expected", b);
      emit log_named_bytes("    Actual", a);
      fail();
    }
  }
}
