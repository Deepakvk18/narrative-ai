/*
  Warnings:

  - Added the required column `image` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "User" ADD COLUMN     "image" TEXT NOT NULL,
ADD COLUMN     "password" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "NickNames" (
    "id" SERIAL NOT NULL,
    "characterId" INTEGER NOT NULL,
    "nickname" TEXT NOT NULL,
    "reason" TEXT NOT NULL,

    CONSTRAINT "NickNames_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "NickNames" ADD CONSTRAINT "NickNames_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
