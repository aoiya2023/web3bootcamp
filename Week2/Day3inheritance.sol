// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract elbow {
    uint public age = 26;

    function bend() public pure virtual returns(string memory) {
        return "bending!";
    }

}

contract leftArm is elbow{
    function raise() public pure virtual returns(string memory) {
        return string.concat("left arm is ", bend());
    }

    function getAge() public view returns(uint) {
        return age;
    }
}

contract rightArm is elbow{
    function raise() public pure virtual returns(string memory) {
        return string.concat("right arm is ", bend());
    }
}

contract person is leftArm, rightArm {

    function raise() public pure override(leftArm, rightArm) returns(string memory) {
        return string.concat("both arms are ", bend());
    }

    function raiseLeftArm() public pure returns(string memory) {
        return leftArm.raise();
    }
}

contract knee is elbow {

    function kick() public pure returns(string memory) {
        return "kicking!";
    }
}

contract alien is knee, rightArm {

    function fly() public pure returns(string memory) {
        return string.concat(kick(), raise());
    }

    function bend() public pure override returns(string memory) {
        return "exfoliating";
    }
}

