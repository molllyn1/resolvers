pragma solidity >=0.4.25;

/**
 * A generic resolver interface which includes all the functions including the ones deprecated
 */
interface Resolver{
    event AddrChanged(bytes32 indexed node, address a);
    event NameChanged(bytes32 indexed node, string name);
    event ABIChanged(bytes32 indexed node, uint256 indexed contentType);
    event PubkeyChanged(bytes32 indexed node, bytes32 x, bytes32 y);
    event TextChanged(bytes32 indexed node, string indexedKey, string key);
    event ContenthashChanged(bytes32 indexed node, bytes hash);
    /* Deprecated events */
    event ContentChanged(bytes32 indexed node, bytes32 hash);

    function ABI(bytes32 node, uint256 contentTypes) external view returns (uint256, bytes memory);
    function addr(bytes32 node) external view returns (address);
    function contenthash(bytes32 node) external view returns (bytes memory);
    function dnsrr(bytes32 node) external view returns (bytes memory);
    function name(bytes32 node) external view returns (string memory);
    function pubkey(bytes32 node) external view returns (bytes32 x, bytes32 y);
    function setABI(bytes32 node, uint256 contentType, bytes calldata data) external;
    function setABIFor(bytes32 node, uint256 contentType, bytes calldata data, bytes calldata signature) external;
    function setAddr(bytes32 node, address addr) external;
    function setAddrFor(bytes32 node, address addr, bytes calldata signature) external;
    function setContenthash(bytes32 node, bytes calldata hash) external;
    function setContenthashFor(bytes32 node, bytes calldata hash, bytes calldata signature) external;
    function setDnsrr(bytes32 node, bytes calldata data) external;
    function setName(bytes32 node, string calldata _name) external;
    function setNameFor(bytes32 node, string calldata name, bytes calldata signature) external;
    function setPubkey(bytes32 node, bytes32 x, bytes32 y) external;
    function setPubkeyFor(bytes32 node, bytes32 x, bytes32 y, bytes calldata signature) external;
    function setText(bytes32 node, string calldata key, string calldata value) external;
    function setTextFor(bytes32 node, string calldata key, string calldata value, bytes calldata signature) external;
    function supportsInterface(bytes4 interfaceID) external pure returns (bool);
    function text(bytes32 node, string calldata key) external view returns (string memory);

    /* Deprecated functions */
    function content(bytes32 node) external view returns (bytes32);
    function multihash(bytes32 node) external view returns (bytes memory);
    function setContent(bytes32 node, bytes32 hash) external;
    function setMultihash(bytes32 node, bytes calldata hash) external;
}