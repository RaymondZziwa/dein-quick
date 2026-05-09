/*
  Warnings:

  - You are about to drop the column `amountPaid` on the `event_participants` table. All the data in the column will be lost.
  - You are about to drop the column `balance` on the `event_participants` table. All the data in the column will be lost.
  - You are about to drop the column `paymentStatus` on the `event_participants` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `event_participants` DROP FOREIGN KEY `event_participants_eventId_fkey`;

-- DropIndex
DROP INDEX `event_participants_eventId_paymentStatus_idx` ON `event_participants`;

-- AlterTable
ALTER TABLE `event_participants` DROP COLUMN `amountPaid`,
    DROP COLUMN `balance`,
    DROP COLUMN `paymentStatus`,
    ADD COLUMN `email` VARCHAR(191) NULL,
    MODIFY `tel2` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `events` ADD COLUMN `capacity` INTEGER NULL,
    ADD COLUMN `ticketsSold` INTEGER NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE `tickets` (
    `id` CHAR(36) NOT NULL,
    `eventId` CHAR(36) NOT NULL,
    `amountPaid` DECIMAL(10, 2) NOT NULL,
    `balance` DECIMAL(10, 2) NOT NULL,
    `paymentStatus` ENUM('PAID', 'PARTIALLY_PAID', 'UNPAID') NOT NULL DEFAULT 'UNPAID',
    `ticketcode` CHAR(36) NOT NULL,
    `participantId` CHAR(36) NOT NULL,
    `ticketToken` VARCHAR(191) NOT NULL,
    `numberOfScans` INTEGER NOT NULL DEFAULT 0,
    `lastScannedAt` DATETIME(3) NULL,
    `status` ENUM('ACTIVE', 'USED', 'CANCELLED', 'EXPIRED') NOT NULL DEFAULT 'ACTIVE',
    `emailSent` BOOLEAN NOT NULL DEFAULT false,
    `smsSent` BOOLEAN NOT NULL DEFAULT false,
    `ticketSentAt` DATETIME(3) NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `tickets_ticketcode_key`(`ticketcode`),
    INDEX `tickets_eventId_idx`(`eventId`),
    INDEX `tickets_participantId_idx`(`participantId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TicketScan` (
    `id` CHAR(36) NOT NULL,
    `ticketId` CHAR(36) NOT NULL,
    `scannedBy` VARCHAR(191) NULL,
    `deviceInfo` VARCHAR(191) NULL,
    `location` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `TicketScan_ticketId_idx`(`ticketId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ticket_payments` (
    `id` CHAR(36) NOT NULL,
    `ticketId` CHAR(36) NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `paymentMethod` VARCHAR(191) NOT NULL,
    `paymentDate` DATETIME(3) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `ticket_payments_ticketId_idx`(`ticketId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE INDEX `event_participants_eventId_idx` ON `event_participants`(`eventId`);

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_eventId_fkey` FOREIGN KEY (`eventId`) REFERENCES `events`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_participantId_fkey` FOREIGN KEY (`participantId`) REFERENCES `event_participants`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TicketScan` ADD CONSTRAINT `TicketScan_ticketId_fkey` FOREIGN KEY (`ticketId`) REFERENCES `tickets`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ticket_payments` ADD CONSTRAINT `ticket_payments_ticketId_fkey` FOREIGN KEY (`ticketId`) REFERENCES `tickets`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
