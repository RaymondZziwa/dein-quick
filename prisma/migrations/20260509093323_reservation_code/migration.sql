/*
  Warnings:

  - Added the required column `reservationCode` to the `event_participants` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `event_participants` ADD COLUMN `reservationCode` VARCHAR(191) NOT NULL;
