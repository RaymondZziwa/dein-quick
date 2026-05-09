-- CreateTable
CREATE TABLE `Withdraw` (
    `id` CHAR(36) NOT NULL,
    `type` ENUM('SHOP_SALES', 'TICKET_SALES') NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `method` ENUM('BANK_TRANSFER', 'MTN_MOMO', 'AIRTEL_MONEY') NOT NULL,
    `status` ENUM('PENDING', 'COMPLETED', 'FAILED') NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Wallet` (
    `id` CHAR(36) NOT NULL,
    `balance` DECIMAL(10, 2) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
