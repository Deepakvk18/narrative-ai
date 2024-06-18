/*
  Warnings:

  - You are about to drop the column `projectId` on the `Arc` table. All the data in the column will be lost.
  - You are about to drop the column `captain` on the `Group` table. All the data in the column will be lost.
  - Added the required column `eraId` to the `Arc` table without a default value. This is not possible if the table is not empty.
  - Added the required column `leader` to the `Group` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Arc" DROP CONSTRAINT "Arc_projectId_fkey";

-- AlterTable
ALTER TABLE "Arc" DROP COLUMN "projectId",
ADD COLUMN     "eraId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Chapter" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Character" ALTER COLUMN "isHuman" SET DEFAULT true;

-- AlterTable
ALTER TABLE "Group" DROP COLUMN "captain",
ADD COLUMN     "leader" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "image" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Arc" ADD CONSTRAINT "Arc_eraId_fkey" FOREIGN KEY ("eraId") REFERENCES "Era"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
