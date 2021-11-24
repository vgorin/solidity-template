// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../token/UpgradeableERC721.sol";

/**
 * @title Zeppelin ERC721 Mock
 *
 * @notice Zeppelin ERC721 Mock simulates an NFT token, used for testing purposes;
 *      it still has restricted access to the mint() function
 *
 * @author Basil Gorin
 */
contract UpgradeableERC721Mock is UpgradeableERC721 {
	/**
	 * @dev "Constructor replacement" for upgradeable, must be execute immediately after deployment
	 *      see https://docs.openzeppelin.com/upgrades-plugins/1.x/writing-upgradeable#initializers
	 *
	 * @param _name token name (ERC721Metadata)
	 * @param _symbol token symbol (ERC721Metadata)
	 */
	function postConstruct(string memory _name, string memory _symbol, address _owner) public virtual initializer {
		// execute all parent initializers in cascade
		UpgradeableERC721._postConstruct(_name, _symbol, _owner);
	}
}

/**
 * @title Zeppelin ERC721 Mock
 *
 * @notice Zeppelin ERC721 Mock simulates an NFT token, used for testing purposes;
 *      it still has restricted access to the mint() function
 *
 * @author Basil Gorin
 */
contract UpgradeableERC721Mock2 is UpgradeableERC721Mock {
	// add version!
	string public version;

	/**
	 * @dev "Constructor replacement" for upgradeable, must be execute immediately after deployment
	 *      see https://docs.openzeppelin.com/upgrades-plugins/1.x/writing-upgradeable#initializers
	 *
	 * @param _name token name (ERC721Metadata)
	 * @param _symbol token symbol (ERC721Metadata)
	 */
	function postConstruct(string memory _name, string memory _symbol, address _owner) public virtual override initializer {
		// execute all parent initializers in cascade
		super._postConstruct(_name, _symbol, _owner);

		// set thee version!
		version = "Version 2 (Upgraded)!";
	}
}
