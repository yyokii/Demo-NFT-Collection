
// MyEpicNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
// いくつかの OpenZeppelin のコントラクトをインポートします。
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// インポートした OpenZeppelin のコントラクトを継承しています。
// 継承したコントラクトのメソッドにアクセスできるようになります。
contract MyEpicNFT is ERC721URIStorage {

  // OpenZeppelin が tokenIds を簡単に追跡するために提供するライブラリを呼び出しています
  using Counters for Counters.Counter;

  // _tokenIdsを初期化（_tokenIds = 0）
  Counters.Counter private _tokenIds;

  // NFT トークンの名前とそのシンボルを渡します。
  constructor() ERC721 ("TanyaNFT", "TANYA") {
    console.log("This is my NFT contract.");
  }

  // ユーザーが NFT を取得するために実行する関数です。
  function makeAnEpicNFT() public {

     // 現在のtokenIdを取得します。tokenIdは0から始まります。
    uint256 newItemId = _tokenIds.current();

     // msg.sender を使って NFT を送信者に Mint します。
    _safeMint(msg.sender, newItemId);

    // NFT データを設定します。
    _setTokenURI(newItemId, "https://api.npoint.io/99b8a61d44f4ef024499");

    // NFTがいつ誰に作成されたかを確認します。
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    // 次の NFT が Mint されるときのカウンターをインクリメントする。
    _tokenIds.increment();
  }
}