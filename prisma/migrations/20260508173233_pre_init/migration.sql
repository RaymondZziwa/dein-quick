/*
  Warnings:

  - Made the column `scannedBy` on table `TicketScan` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `TicketScan` MODIFY `scannedBy` CHAR(36) NOT NULL;

-- AlterTable
ALTER TABLE `events` ADD COLUMN `balance` DECIMAL(10, 2) NOT NULL DEFAULT 0,
    ADD COLUMN `totalRevenue` DECIMAL(10, 2) NOT NULL DEFAULT 0,
    ADD COLUMN `totalWithdrawn` DECIMAL(10, 2) NOT NULL DEFAULT 0;

-- CreateIndex
CREATE INDEX `TicketScan_scannedBy_idx` ON `TicketScan`(`scannedBy`);

-- AddForeignKey
ALTER TABLE `event_participants` ADD CONSTRAINT `event_participants_eventId_fkey` FOREIGN KEY (`eventId`) REFERENCES `events`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TicketScan` ADD CONSTRAINT `TicketScan_scannedBy_fkey` FOREIGN KEY (`scannedBy`) REFERENCES `employees`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
