/*
  Warnings:

  - You are about to drop the column `method` on the `Withdraw` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `Withdraw` table. All the data in the column will be lost.
  - Added the required column `channelId` to the `Wallet` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Wallet` table without a default value. This is not possible if the table is not empty.
  - Added the required column `walletId` to the `Withdraw` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Wallet` ADD COLUMN `channelId` VARCHAR(191) NOT NULL,
    ADD COLUMN `name` VARCHAR(191) NOT NULL,
    ADD COLUMN `purpose` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Withdraw` DROP COLUMN `method`,
    DROP COLUMN `type`,
    ADD COLUMN `walletId` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `WithdrawChannel` (
    `id` CHAR(36) NOT NULL,
    `type` ENUM('BANK_TRANSFER', 'MOBILE_MONEY') NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `phoneNumber` VARCHAR(191) NULL,
    `bank` VARCHAR(191) NULL,
    `accountNumber` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Withdraw` ADD CONSTRAINT `Withdraw_walletId_fkey` FOREIGN KEY (`walletId`) REFERENCES `Wallet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Wallet` ADD CONSTRAINT `Wallet_channelId_fkey` FOREIGN KEY (`channelId`) REFERENCES `WithdrawChannel`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
