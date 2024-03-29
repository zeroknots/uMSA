// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "src/lib/ModeLib.sol";

contract ModeLibTest is Test {
    function setUp() public { }

    function test_encode_decode() public {
        CallType callType = CALLTYPE_SINGLE;
        ExecType execType = EXECTYPE_REVERT;
        ModeSelector modeSelector = MODE_DEFAULT;
        ModePayload payload = ModePayload.wrap(bytes22(hex"01"));
        ModeCode enc = ModeLib.encode(callType, execType, modeSelector, payload);

        console2.logBytes32(ModeCode.unwrap(enc));

        (CallType _calltype, ExecType _execType, ModeSelector _mode, ModePayload _payload) =
            ModeLib.decode(enc);
        assertTrue(_calltype == callType);
        assertTrue(_execType == execType);
        assertTrue(_mode == modeSelector);
        // assertTrue(_payload == payload);
    }
}
