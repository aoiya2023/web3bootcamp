//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface ISignature {
    function signMe(address _signer, string memory _signature) external returns(string memory);
    function getSignature(address _signer) external view returns(string memory);
}

contract Sign {
    ISignature contractToSign = ISignature(0x3CdBff65DaC67cDb6E5c4F05c4DB8FE05C20e4D8);
    
    function signContract(string memory _message) public returns (string memory) {
        return contractToSign.signMe(msg.sender, _message);
    }
    function getSignature() public view returns(string memory) {
        return contractToSign.getSignature(msg.sender);
    }
}

// contract tokenAoi is ERC20("Aoi", "AOI") {
//     function sendFive() public {
//         _mint(0x3CdBff65DaC67cDb6E5c4F05c4DB8FE05C20e4D8, 5);
//     }
// }