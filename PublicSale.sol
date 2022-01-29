// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.7.6;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the name of token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

pragma solidity ^0.7.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165Upgradeable {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

pragma solidity ^0.7.0;

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721Upgradeable is IERC165Upgradeable {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId)
        external
        view
        returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

pragma solidity ^0.7.0;

interface IFNDNFT721 {
    function tokenCreator(uint256 tokenId)
        external
        view
        returns (address payable);

    function getTokenCreatorPaymentAddress(uint256 tokenId)
        external
        view
        returns (address payable);

    function getTokenRoyalty(uint256 tokenId) external view returns (uint256);
}

pragma solidity ^0.7.0;

/**
 * @dev Constant values shared across mixins.
 */
abstract contract Constants {
    uint256 internal constant BASIS_POINTS = 10000;
}

pragma solidity >=0.4.24 <0.8.0;

/**
 * @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
 * behind a proxy. Since a proxied contract can't have a constructor, it's common to move constructor logic to an
 * external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
 * function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
 *
 * TIP: To avoid leaving the proxy in an uninitialized state, the initializer function should be called as early as
 * possible by providing the encoded function call as the `_data` argument to {UpgradeableProxy-constructor}.
 *
 * CAUTION: When used with inheritance, manual care must be taken to not invoke a parent initializer twice, or to ensure
 * that all initializers are idempotent. This is not verified automatically as constructors are by Solidity.
 */
abstract contract Initializable {
    /**
     * @dev Indicates that the contract has been initialized.
     */
    bool private _initialized;

    /**
     * @dev Indicates that the contract is in the process of being initialized.
     */
    bool private _initializing;

    /**
     * @dev Modifier to protect an initializer function from being invoked twice.
     */
    modifier initializer() {
        require(
            _initializing || _isConstructor() || !_initialized,
            "Initializable: contract is already initialized"
        );

        bool isTopLevelCall = !_initializing;
        if (isTopLevelCall) {
            _initializing = true;
            _initialized = true;
        }

        _;

        if (isTopLevelCall) {
            _initializing = false;
        }
    }

    /// @dev Returns true if and only if the function is running in the constructor
    function _isConstructor() private view returns (bool) {
        return !AddressUpgradeable.isContract(address(this));
    }
}

pragma solidity ^0.7.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuardUpgradeable is Initializable {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    function __ReentrancyGuard_init() internal initializer {
        __ReentrancyGuard_init_unchained();
    }

    function __ReentrancyGuard_init_unchained() internal initializer {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
    uint256[49] private __gap;
}

pragma solidity ^0.7.0;

/**
 * @dev Collection of functions related to the address type
 */
library AddressUpgradeable {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{value: amount}("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return
            functionCallWithValue(
                target,
                data,
                value,
                "Address: low-level call with value failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(
            address(this).balance >= value,
            "Address: insufficient balance for call"
        );
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{value: value}(
            data
        );
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data)
        internal
        view
        returns (bytes memory)
    {
        return
            functionStaticCall(
                target,
                data,
                "Address: low-level static call failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) private pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File contracts/mixins/SendValueWithFallbackWithdraw.sol

pragma solidity ^0.7.0;

/**
 * @notice Attempt to send ETH and if the transfer fails or runs out of gas, store the balance
 * for future withdrawal instead.
 */
abstract contract SendValueWithFallbackWithdraw is ReentrancyGuardUpgradeable {
    using AddressUpgradeable for address payable;
    using SafeMathUpgradeable for uint256;

    mapping(address => uint256) private pendingWithdrawals;

    event WithdrawPending(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);

    /**
     * @notice Returns how much funds are available for manual withdraw due to failed transfers.
     */
    function getPendingWithdrawal(address user) public view returns (uint256) {
        return pendingWithdrawals[user];
    }

    /**
     * @notice Allows a user to manually withdraw funds which originally failed to transfer to themselves.
     */
    function withdraw() public {
        withdrawFor(msg.sender);
    }

    /**
     * @notice Allows anyone to manually trigger a withdrawal of funds which originally failed to transfer for a user.
     */
    function withdrawFor(address payable user) public nonReentrant {
        uint256 amount = pendingWithdrawals[user];
        require(amount > 0, "No funds are pending withdrawal");
        pendingWithdrawals[user] = 0;
        user.sendValue(amount);
        emit Withdrawal(user, amount);
    }

    /**
     * @dev Attempt to send a user ETH with a reasonably low gas limit of 20k,
     * which is enough to send to contracts as well.
     */
    function _sendValueWithFallbackWithdrawWithLowGasLimit(
        address mode,
        address payable user,
        uint256 amount
    ) internal {
        _sendValueWithFallbackWithdraw(mode, user, amount, 20000);
    }

    /**
     * @dev Attempt to send a user or contract ETH with a moderate gas limit of 90k,
     * which is enough for a 5-way split.
     */
    function _sendValueWithFallbackWithdrawWithMediumGasLimit(
        address paymentMode,
        address payable user,
        uint256 amount
    ) internal {
        _sendValueWithFallbackWithdraw(paymentMode, user, amount, 210000);
    }

    /**
     * @dev Attempt to send a user or contract ETH and if it fails store the amount owned for later withdrawal.
     */
    function _sendValueWithFallbackWithdraw(
        address mode,
        address payable user,
        uint256 amount,
        uint256 gasLimit
    ) private {
        if (amount == 0) {
            return;
        }
        if (mode == address(0)) {
            // Cap the gas to prevent consuming all available gas to block a tx from completing successfully
            // solhint-disable-next-line avoid-low-level-calls
            (bool success, ) = user.call{value: amount, gas: gasLimit}("");
            if (!success) {
                // Record failed sends for a withdrawal later
                // Transfers could fail if sent to a multisig with non-trivial receiver logic
                // solhint-disable-next-line reentrancy
                pendingWithdrawals[user] = pendingWithdrawals[user].add(amount);
                emit WithdrawPending(user, amount);
            }
        } else {
            require(IERC20(mode).transfer(user, amount));
        }
    }

    uint256[499] private ______gap;
}

pragma solidity ^0.7.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMathUpgradeable {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        uint256 c = a + b;
        if (c < a) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        if (b > a) return (false, 0);
        return (true, a - b);
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) return (true, 0);
        uint256 c = a * b;
        if (c / a != b) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        if (b == 0) return (false, 0);
        return (true, a / b);
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        if (b == 0) return (false, 0);
        return (true, a % b);
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: modulo by zero");
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        return a - b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryDiv}.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a % b;
    }
}

pragma solidity ^0.7.0;

/**
 * @notice A mixin that stores a reference to the Foundation treasury contract.
 */
abstract contract FoundationTreasuryNode is Initializable {
    using AddressUpgradeable for address payable;

    address payable private treasury;

    /**
     * @dev Called once after the initial deployment to set the Foundation treasury address.
     */
    function _initializeFoundationTreasuryNode(address payable _treasury)
        internal
        initializer
    {
        require(
            _treasury.isContract(),
            "FoundationTreasuryNode: Address is not a contract"
        );
        treasury = _treasury;
    }

    /**
     * @notice Returns the address of the Foundation treasury.
     */
    function getFoundationTreasury() public view returns (address payable) {
        return treasury;
    }

    // `______gap` is added to each mixin to allow adding new data slots or additional mixins in an upgrade-safe way.
    uint256[2000] private __gap;
}

// File contracts/interfaces/IAdminRole.sol

pragma solidity ^0.7.0;

/**
 * @notice Interface for AdminRole which wraps the default admin role from
 * OpenZeppelin's AccessControl for easy integration.
 */
interface IAdminRole {
    function isAdmin(address account) external view returns (bool);
}

// File contracts/roles/FoundationAdminRole.sol

pragma solidity ^0.7.0;

/**
 * @notice Allows a contract to leverage the admin role defined by the Foundation treasury.
 */
abstract contract FoundationAdminRole is FoundationTreasuryNode {
    // This file uses 0 data slots (other than what's included via FoundationTreasuryNode)

    modifier onlyFoundationAdmin() {
        require(
            _isFoundationAdmin(),
            "FoundationAdminRole: caller does not have the Admin role"
        );
        _;
    }

    function _isFoundationAdmin() internal view returns (bool) {
        return IAdminRole(getFoundationTreasury()).isAdmin(msg.sender);
    }
}

// File contracts/interfaces/IOperatorRole.sol

pragma solidity ^0.7.0;

/**
 * @notice Interface for OperatorRole which wraps a role from
 * OpenZeppelin's AccessControl for easy integration.
 */
interface IOperatorRole {
    function isOperator(address account) external view returns (bool);
}

// File contracts/roles/FoundationOperatorRole.sol

pragma solidity ^0.7.0;

/**
 * @notice Allows a contract to leverage the operator role defined by the Foundation treasury.
 */
abstract contract FoundationOperatorRole is FoundationTreasuryNode {
    // This file uses 0 data slots (other than what's included via FoundationTreasuryNode)

    function _isFoundationOperator() internal view returns (bool) {
        return IOperatorRole(getFoundationTreasury()).isOperator(msg.sender);
    }
}

pragma solidity ^0.7.0;

/**
 * @notice A place for common modifiers and functions used by various NFTMarket mixins, if any.
 * @dev This also leaves a gap which can be used to add a new mixin to the top of the inheritance tree.
 */
abstract contract NFTMarketCore {
    /**
     * @dev If the auction did not have an escrowed seller to return, this falls back to return the current owner.
     * This allows functions to calculate the correct fees before the NFT has been listed in auction.
     */
    function _getSellerFor(address nftContract, uint256 tokenId)
        internal
        view
        virtual
        returns (address payable)
    {
        return payable(IERC721Upgradeable(nftContract).ownerOf(tokenId));
    }

    // 50 slots were consumed by adding ReentrancyGuardUpgradeable
    uint256[950] private ______gap;
}

pragma solidity ^0.7.0;

/**
 * @notice A mixin for associating creators to NFTs.
 * @dev In the future this may store creators directly in order to support NFTs created on a different platform.
 */
abstract contract NFTMarketCreators is
    ReentrancyGuardUpgradeable // Adding this unused mixin to help with linearization
{
    /**
     * @dev If the creator is not available then 0x0 is returned. Downstream this indicates that the creator
     * fee should be sent to the current seller instead.
     * This may apply when selling NFTs that were not minted on Foundation.
     */
    function _getCreator(address nftContract, uint256 tokenId)
        internal
        view
        returns (address payable)
    {
        try IFNDNFT721(nftContract).tokenCreator(tokenId) returns (
            address payable creator
        ) {
            return creator;
        } catch {
            return address(0);
        }
    }

    /**
     * @dev Returns the creator and a destination address for any payments to the creator,
     * returns address(0) if the creator is unknown.
     */
    function _getCreatorAndPaymentAddress(address nftContract, uint256 tokenId)
        internal
        view
        returns (address payable, address payable)
    {
        address payable creator = _getCreator(nftContract, tokenId);
        try
            IFNDNFT721(nftContract).getTokenCreatorPaymentAddress(tokenId)
        returns (address payable tokenCreatorPaymentAddress) {
            if (tokenCreatorPaymentAddress != address(0)) {
                return (creator, tokenCreatorPaymentAddress);
            }
        } catch // solhint-disable-next-line no-empty-blocks
        {
            // Fall through to return (creator, creator) below
        }
        return (creator, creator);
    }

    // 500 slots were added via the new SendValueWithFallbackWithdraw mixin
    uint256[500] private ______gap;
}

pragma solidity ^0.7.0;

/**
 * @notice A mixin to distribute funds when an NFT is sold.
 */
abstract contract NFTMarketFees is
    Constants,
    Initializable,
    FoundationTreasuryNode,
    NFTMarketCore,
    NFTMarketCreators,
    SendValueWithFallbackWithdraw
{
    using SafeMathUpgradeable for uint256;

    event MarketFeesUpdated(
        uint256 primaryFoundationFeeBasisPoints,
        uint256 secondaryFoundationFeeBasisPoints
    );

    uint256 private _primaryFoundationFeeBasisPoints;
    uint256 private _secondaryFoundationFeeBasisPoints;

    mapping(address => mapping(uint256 => bool))
        private nftContractToTokenIdToFirstSaleCompleted;

    /**
     * @notice Returns true if the given NFT has not been sold in this market previously and is being sold by the creator.
     */
    function getIsPrimary(address nftContract, uint256 tokenId)
        public
        view
        returns (bool)
    {
        return
            _getIsPrimary(
                nftContract,
                tokenId,
                _getCreator(nftContract, tokenId),
                _getSellerFor(nftContract, tokenId)
            );
    }

    /**
     * @dev A helper that determines if this is a primary sale given the current seller.
     * This is a minor optimization to use the seller if already known instead of making a redundant lookup call.
     */
    function _getIsPrimary(
        address nftContract,
        uint256 tokenId,
        address creator,
        address seller
    ) private view returns (bool) {
        return
            !nftContractToTokenIdToFirstSaleCompleted[nftContract][tokenId] &&
            creator == seller;
    }

    /**
     * @notice Returns the current fee configuration in basis points.
     */
    function getFeeConfig(address nftContract, uint256 tokenId)
        public
        view
        returns (
            uint256 primaryFoundationFeeBasisPoints,
            uint256 secondaryFoundationFeeBasisPoints,
            uint256 secondaryCreatorFeeBasisPoints
        )
    {
        return (
            _primaryFoundationFeeBasisPoints,
            _secondaryFoundationFeeBasisPoints,
            IFNDNFT721(nftContract).getTokenRoyalty(tokenId)
        );
    }

    /**
     * @notice Returns the fees of foundation in basis points
     */

    function getFoundationFees()
        public
        view
        returns (
            uint256 primaryFoundationFeeBasisPoints,
            uint256 secondaryFoundationFeeBasisPoints
        )
    {
        return (
            _primaryFoundationFeeBasisPoints,
            _secondaryFoundationFeeBasisPoints
        );
    }

    /**
     * @notice Returns how funds will be distributed for a sale at the given price point.
     * @dev This could be used to present exact fee distributing on listing or before a bid is placed.
     */
    function getFees(
        address nftContract,
        uint256 tokenId,
        uint256 price
    )
        public
        view
        returns (
            uint256 foundationFee,
            uint256 creatorSecondaryFee,
            uint256 ownerRev
        )
    {
        (foundationFee, , creatorSecondaryFee, , ownerRev) = _getFees(
            nftContract,
            tokenId,
            _getSellerFor(nftContract, tokenId),
            price
        );
    }

    /**
     * @dev Calculates how funds should be distributed for the given sale details.
     * If this is a primary sale, the creator revenue will appear as `ownerRev`.
     */
    function _getFees(
        address nftContract,
        uint256 tokenId,
        address payable seller,
        uint256 price
    )
        private
        view
        returns (
            uint256 foundationFee,
            address payable creatorSecondaryFeeTo,
            uint256 creatorSecondaryFee,
            address payable ownerRevTo,
            uint256 ownerRev
        )
    {
        // The tokenCreatorPaymentAddress replaces the creator as the fee recipient.
        (
            address payable creator,
            address payable tokenCreatorPaymentAddress
        ) = _getCreatorAndPaymentAddress(nftContract, tokenId);
        uint256 foundationFeeBasisPoints;
        if (_getIsPrimary(nftContract, tokenId, creator, seller)) {
            foundationFeeBasisPoints = _primaryFoundationFeeBasisPoints;
            // On a primary sale, the creator is paid the remainder via `ownerRev`.
            ownerRevTo = tokenCreatorPaymentAddress;
        } else {
            uint256 secondaryCreatorFeeBasisPoints = IFNDNFT721(nftContract)
                .getTokenRoyalty(tokenId);
            foundationFeeBasisPoints = _secondaryFoundationFeeBasisPoints;

            // If there is no creator then funds go to the seller instead.
            if (tokenCreatorPaymentAddress != address(0)) {
                // SafeMath is not required when dividing by a constant value > 0.
                creatorSecondaryFee =
                    price.mul(secondaryCreatorFeeBasisPoints) /
                    BASIS_POINTS;
                creatorSecondaryFeeTo = tokenCreatorPaymentAddress;
            }

            if (seller == creator) {
                ownerRevTo = tokenCreatorPaymentAddress;
            } else {
                ownerRevTo = seller;
            }
        }
        // SafeMath is not required when dividing by a constant value > 0.
        foundationFee = price.mul(foundationFeeBasisPoints) / BASIS_POINTS;
        ownerRev = price.sub(foundationFee).sub(creatorSecondaryFee);
    }

    /**
     * @dev Distributes funds to foundation, creator, and NFT owner after a sale.
     */
    function _distributeFunds(
        address mode,
        address nftContract,
        uint256 tokenId,
        address payable seller,
        uint256 price
    )
        internal
        returns (
            uint256 foundationFee,
            uint256 creatorFee,
            uint256 ownerRev
        )
    {
        address payable creatorFeeTo;
        address payable ownerRevTo;
        (
            foundationFee,
            creatorFeeTo,
            creatorFee,
            ownerRevTo,
            ownerRev
        ) = _getFees(nftContract, tokenId, seller, price);

        // Anytime fees are distributed that indicates the first sale is complete,
        // which will not change state during a secondary sale.
        // This must come after the `_getFees` call above as this state is considered in the function.
        nftContractToTokenIdToFirstSaleCompleted[nftContract][tokenId] = true;

        _sendValueWithFallbackWithdrawWithLowGasLimit(
            mode,
            getFoundationTreasury(),
            foundationFee
        );
        _sendValueWithFallbackWithdrawWithMediumGasLimit(
            mode,
            creatorFeeTo,
            creatorFee
        );
        _sendValueWithFallbackWithdrawWithMediumGasLimit(
            mode,
            ownerRevTo,
            ownerRev
        );
    }

    /**
     * @notice Allows Foundation to change the market fees.
     */
    function _updateMarketFees(
        uint256 primaryFoundationFeeBasisPoints,
        uint256 secondaryFoundationFeeBasisPoints
    ) internal {
        require(
            primaryFoundationFeeBasisPoints < BASIS_POINTS,
            "NFTMarketFees: Fees >= 100%"
        );

        require(
            secondaryFoundationFeeBasisPoints < BASIS_POINTS,
            "NFTMarketFees: Fees >= 100%"
        );

        _primaryFoundationFeeBasisPoints = primaryFoundationFeeBasisPoints;
        _secondaryFoundationFeeBasisPoints = secondaryFoundationFeeBasisPoints;

        emit MarketFeesUpdated(
            primaryFoundationFeeBasisPoints,
            secondaryFoundationFeeBasisPoints
        );
    }

    uint256[1000] private ______gap;
}

abstract contract NFTPublicSale is
    FoundationTreasuryNode,
    FoundationAdminRole,
    FoundationOperatorRole,
    NFTMarketFees
{
    struct PublicSale {
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable buyer;
        uint256 amount;
        address paymentMode;
    }

    //mapping from tokenId to Public Sale values
    mapping(address => mapping(uint256 => PublicSale)) public tokenIdToSale;

    //mapping of accepted tokens
    mapping(address => bool) public tokens;

    uint256 private EXTENSION_DURATION = 1 days;

    event PublicSaleCreated(
        address indexed seller,
        address indexed nftContract,
        uint256 indexed tokenId,
        address paymentMode,
        uint256 amount
    );

    event PublicSaleFinalized(
        address buyer,
        address indexed seller,
        address indexed nftContract,
        uint256 indexed tokenId,
        uint256 amount,
        uint256 f8nFee,
        uint256 creatorFee,
        uint256 ownerRev
    );

    event PublicSaleUpdated(
        address indexed nftContract,
        uint256 indexed tokenId,
        uint256 amount
    );

    event PublicSaleCanceled(
        address indexed nftContract,
        uint256 indexed tokenId
    );

    event TokenUpdated(
        address indexed tokenAddress,
        bool indexed status,
        string name
    );

    modifier onlyValidSaleConfig(uint256 amount) {
        require(amount > 0, "NFTPublicSale: Amount must be greater than zero");
        _;
    }

    /**
     * @notice Allows Foundation to add token address.
     */

    function adminUpdateToken(address tokenAddress, bool status)
        public
        onlyFoundationAdmin
    {
        tokens[tokenAddress] = status;
        if (tokenAddress == address(0)) {
            emit TokenUpdated(tokenAddress, status, "Matic");
        } else {
            emit TokenUpdated(
                tokenAddress,
                status,
                IERC20(tokenAddress).name()
            );
        }
    }

    /**
     * @notice Creates a public sale for the given NFT.
     * The NFT is held in escrow until the sale is finalized or canceled.
     */

    function createPublicSale(
        address nftContract,
        uint256 tokenId,
        uint256 amount,
        address paymentMode
    ) public onlyValidSaleConfig(amount) {
        require(tokens[paymentMode], "NFTPublicSale:TOKEN_NOT_SUPPORTED");
        tokenIdToSale[nftContract][tokenId] = PublicSale(
            nftContract,
            tokenId,
            msg.sender,
            address(0),
            amount,
            paymentMode
        );
        IERC721Upgradeable(nftContract).transferFrom(
            msg.sender,
            address(this),
            tokenId
        );

        emit PublicSaleCreated(
            msg.sender,
            nftContract,
            tokenId,
            paymentMode,
            amount
        );
    }

    /**
     * @notice If a sale has been created, the configuration
     * such as the amount may be changed by the seller.
     */

    function updatePublicSale(
        address nftContract,
        uint256 tokenId,
        uint256 amount
    ) public onlyValidSaleConfig(amount) {
        PublicSale memory sale = tokenIdToSale[nftContract][tokenId];
        require(msg.sender == sale.seller, "NFTPublicSale: Invalid access");
        sale.amount = amount;

        emit PublicSaleUpdated(nftContract, tokenId, amount);
    }

    /**
     * @notice If a sale has been created, it may be canceled by the seller.
     * The NFT is returned to the seller from escrow.
     */

    function cancelPublicSale(address nftContract, uint256 tokenId) public {
        PublicSale memory sale = tokenIdToSale[nftContract][tokenId];
        require(msg.sender == sale.seller, "NFTPublicSale: Invalid access");

        delete tokenIdToSale[sale.nftContract][sale.tokenId];

        IERC721Upgradeable(sale.nftContract).transferFrom(
            address(this),
            sale.seller,
            sale.tokenId
        );

        emit PublicSaleCanceled(nftContract, tokenId);
    }

    /**
     * @notice Buyer calls this function and pays the required amount.
     * This will send the NFT to the buyer and distribute funds.
     */
    function finalizePublicSale(
        address nftContract,
        uint256 tokenId,
        uint256 amount
    ) public payable {
        PublicSale memory sale = tokenIdToSale[nftContract][tokenId];
        require(sale.amount != 0, "NFTPublicSale: Sale not found");
        uint256 sellAmount = sale.amount;
        if (sale.paymentMode == address(0)) {
            amount = msg.value;
        } else {
            IERC20(sale.paymentMode).transferFrom(
                msg.sender,
                address(this),
                amount
            );
        }
        require(
            amount >= sellAmount,
            "NFTPublicSale: Amount lesser than allocated"
        );
        sale.buyer = msg.sender;

        delete tokenIdToSale[sale.nftContract][sale.tokenId];

        IERC721Upgradeable(sale.nftContract).transferFrom(
            address(this),
            sale.buyer,
            sale.tokenId
        );

        (
            uint256 f8nFee,
            uint256 creatorFee,
            uint256 ownerRev
        ) = _distributeFunds(
                sale.paymentMode,
                sale.nftContract,
                sale.tokenId,
                sale.seller,
                sale.amount
            );

        emit PublicSaleFinalized(
            msg.sender,
            sale.seller,
            nftContract,
            tokenId,
            amount,
            f8nFee,
            creatorFee,
            ownerRev
        );
    }
}

// File contracts/BlingPublicSale.sol

pragma solidity 0.7.6;
pragma abicoder v2;

/**
 * @title A public sale for NFTs on Bling.
 */

contract BlingPublicSale is
    FoundationTreasuryNode,
    FoundationAdminRole,
    NFTMarketFees,
    NFTPublicSale
{
    /**
     * @notice Called once to configure the contract after the initial deployment.
     * @dev This farms the initialize call out to inherited contracts as needed.
     */
    function initialize(address payable treasury) public initializer {
        FoundationTreasuryNode._initializeFoundationTreasuryNode(treasury);
    }

    /**
     * @notice Allows Foundation to update the market configuration.
     */
    function adminUpdateConfig(
        uint256 primaryF8nFeeBasisPoints,
        uint256 secondaryF8nFeeBasisPoints
    ) public onlyFoundationAdmin {
        _updateMarketFees(primaryF8nFeeBasisPoints, secondaryF8nFeeBasisPoints);
    }
}