/*
  Warnings:

  - The primary key for the `Arc` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ArtifactsAndWeapons` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Chapter` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ChapterExcerpt` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Character` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `earId` on the `Character` table. All the data in the column will be lost.
  - The primary key for the `CharacterImage` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `CharacterProgression` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `CharacterRelationship` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `CharacterType` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Clothes` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Conflict` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Era` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Event` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ExcerptCharacter` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Family` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Group` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ImageExcerpt` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `NickNames` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Occupation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Panel` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Place` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PlaceImage` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PowerMove` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PowerMoveImage` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PowerSystem` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PowerType` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Project` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ProjectRight` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Role` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `RolePermission` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `SubPlace` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `SubPlaceProgression` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `eraId` to the `Character` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Arc" DROP CONSTRAINT "Arc_eraId_fkey";

-- DropForeignKey
ALTER TABLE "ArtifactsAndWeapons" DROP CONSTRAINT "ArtifactsAndWeapons_ownedByCharacterId_fkey";

-- DropForeignKey
ALTER TABLE "ArtifactsAndWeapons" DROP CONSTRAINT "ArtifactsAndWeapons_ownedByFamilyId_fkey";

-- DropForeignKey
ALTER TABLE "ArtifactsAndWeapons" DROP CONSTRAINT "ArtifactsAndWeapons_ownedByGroupId_fkey";

-- DropForeignKey
ALTER TABLE "Chapter" DROP CONSTRAINT "Chapter_arcId_fkey";

-- DropForeignKey
ALTER TABLE "ChapterExcerpt" DROP CONSTRAINT "ChapterExcerpt_chapterId_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_earId_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_projectId_fkey";

-- DropForeignKey
ALTER TABLE "CharacterImage" DROP CONSTRAINT "CharacterImage_characterProgressionId_fkey";

-- DropForeignKey
ALTER TABLE "CharacterProgression" DROP CONSTRAINT "CharacterProgression_characterId_fkey";

-- DropForeignKey
ALTER TABLE "CharacterProgression" DROP CONSTRAINT "CharacterProgression_characterTypeId_fkey";

-- DropForeignKey
ALTER TABLE "CharacterProgression" DROP CONSTRAINT "CharacterProgression_occupationId_fkey";

-- DropForeignKey
ALTER TABLE "CharacterRelationship" DROP CONSTRAINT "CharacterRelationship_characterProgressionId_fkey";

-- DropForeignKey
ALTER TABLE "CharacterRelationship" DROP CONSTRAINT "CharacterRelationship_relatedCharacterProgressionId_fkey";

-- DropForeignKey
ALTER TABLE "Conflict" DROP CONSTRAINT "Conflict_attackgroupid_fkey";

-- DropForeignKey
ALTER TABLE "Conflict" DROP CONSTRAINT "Conflict_defensiveGroupId_fkey";

-- DropForeignKey
ALTER TABLE "Conflict" DROP CONSTRAINT "Conflict_eraId_fkey";

-- DropForeignKey
ALTER TABLE "Era" DROP CONSTRAINT "Era_projectId_fkey";

-- DropForeignKey
ALTER TABLE "Event" DROP CONSTRAINT "Event_eraId_fkey";

-- DropForeignKey
ALTER TABLE "ExcerptCharacter" DROP CONSTRAINT "ExcerptCharacter_characterProgressionId_fkey";

-- DropForeignKey
ALTER TABLE "ExcerptCharacter" DROP CONSTRAINT "ExcerptCharacter_excerptId_fkey";

-- DropForeignKey
ALTER TABLE "Group" DROP CONSTRAINT "Group_projectId_fkey";

-- DropForeignKey
ALTER TABLE "ImageExcerpt" DROP CONSTRAINT "ImageExcerpt_characterProgressionId_fkey";

-- DropForeignKey
ALTER TABLE "ImageExcerpt" DROP CONSTRAINT "ImageExcerpt_imageId_fkey";

-- DropForeignKey
ALTER TABLE "NickNames" DROP CONSTRAINT "NickNames_characterId_fkey";

-- DropForeignKey
ALTER TABLE "Occupation" DROP CONSTRAINT "Occupation_projectId_fkey";

-- DropForeignKey
ALTER TABLE "Panel" DROP CONSTRAINT "Panel_chapterId_fkey";

-- DropForeignKey
ALTER TABLE "Panel" DROP CONSTRAINT "Panel_placeId_fkey";

-- DropForeignKey
ALTER TABLE "Place" DROP CONSTRAINT "Place_ownedByCharacterId_fkey";

-- DropForeignKey
ALTER TABLE "Place" DROP CONSTRAINT "Place_ownedByFamilyId_fkey";

-- DropForeignKey
ALTER TABLE "Place" DROP CONSTRAINT "Place_ownedByGroupId_fkey";

-- DropForeignKey
ALTER TABLE "Place" DROP CONSTRAINT "Place_projectId_fkey";

-- DropForeignKey
ALTER TABLE "PlaceImage" DROP CONSTRAINT "PlaceImage_subPlaceId_fkey";

-- DropForeignKey
ALTER TABLE "PowerMove" DROP CONSTRAINT "PowerMove_powerTypeId_fkey";

-- DropForeignKey
ALTER TABLE "PowerMoveImage" DROP CONSTRAINT "PowerMoveImage_powerMoveId_fkey";

-- DropForeignKey
ALTER TABLE "PowerType" DROP CONSTRAINT "PowerType_powerSystemId_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_createdById_fkey";

-- DropForeignKey
ALTER TABLE "ProjectRight" DROP CONSTRAINT "ProjectRight_projectId_fkey";

-- DropForeignKey
ALTER TABLE "ProjectRight" DROP CONSTRAINT "ProjectRight_roleId_fkey";

-- DropForeignKey
ALTER TABLE "ProjectRight" DROP CONSTRAINT "ProjectRight_userId_fkey";

-- DropForeignKey
ALTER TABLE "RolePermission" DROP CONSTRAINT "RolePermission_roleId_fkey";

-- DropForeignKey
ALTER TABLE "SubPlace" DROP CONSTRAINT "SubPlace_placeId_fkey";

-- DropForeignKey
ALTER TABLE "SubPlaceProgression" DROP CONSTRAINT "SubPlaceProgression_subPlaceId_fkey";

-- DropForeignKey
ALTER TABLE "_ArcToPlace" DROP CONSTRAINT "_ArcToPlace_A_fkey";

-- DropForeignKey
ALTER TABLE "_ArcToPlace" DROP CONSTRAINT "_ArcToPlace_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterProgressionToClothes" DROP CONSTRAINT "_CharacterProgressionToClothes_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterProgressionToClothes" DROP CONSTRAINT "_CharacterProgressionToClothes_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterProgressionToGroup" DROP CONSTRAINT "_CharacterProgressionToGroup_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterProgressionToGroup" DROP CONSTRAINT "_CharacterProgressionToGroup_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToFamily" DROP CONSTRAINT "_CharacterToFamily_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToFamily" DROP CONSTRAINT "_CharacterToFamily_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToPowerMove" DROP CONSTRAINT "_CharacterToPowerMove_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToPowerMove" DROP CONSTRAINT "_CharacterToPowerMove_B_fkey";

-- AlterTable
ALTER TABLE "Arc" DROP CONSTRAINT "Arc_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "eraId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Arc_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Arc_id_seq";

-- AlterTable
ALTER TABLE "ArtifactsAndWeapons" DROP CONSTRAINT "ArtifactsAndWeapons_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "ownedByGroupId" SET DATA TYPE TEXT,
ALTER COLUMN "ownedByFamilyId" SET DATA TYPE TEXT,
ALTER COLUMN "ownedByCharacterId" SET DATA TYPE TEXT,
ADD CONSTRAINT "ArtifactsAndWeapons_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "ArtifactsAndWeapons_id_seq";

-- AlterTable
ALTER TABLE "Chapter" DROP CONSTRAINT "Chapter_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "arcId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Chapter_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Chapter_id_seq";

-- AlterTable
ALTER TABLE "ChapterExcerpt" DROP CONSTRAINT "ChapterExcerpt_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "chapterId" SET DATA TYPE TEXT,
ADD CONSTRAINT "ChapterExcerpt_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "ChapterExcerpt_id_seq";

-- AlterTable
ALTER TABLE "Character" DROP CONSTRAINT "Character_pkey",
DROP COLUMN "earId",
ADD COLUMN     "eraId" TEXT NOT NULL,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "projectId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Character_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Character_id_seq";

-- AlterTable
ALTER TABLE "CharacterImage" DROP CONSTRAINT "CharacterImage_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "characterProgressionId" SET DATA TYPE TEXT,
ADD CONSTRAINT "CharacterImage_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "CharacterImage_id_seq";

-- AlterTable
ALTER TABLE "CharacterProgression" DROP CONSTRAINT "CharacterProgression_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "age" SET DATA TYPE TEXT,
ALTER COLUMN "occupationId" SET DATA TYPE TEXT,
ALTER COLUMN "characterId" SET DATA TYPE TEXT,
ALTER COLUMN "characterTypeId" SET DATA TYPE TEXT,
ADD CONSTRAINT "CharacterProgression_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "CharacterProgression_id_seq";

-- AlterTable
ALTER TABLE "CharacterRelationship" DROP CONSTRAINT "CharacterRelationship_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "characterProgressionId" SET DATA TYPE TEXT,
ALTER COLUMN "relatedCharacterProgressionId" SET DATA TYPE TEXT,
ADD CONSTRAINT "CharacterRelationship_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "CharacterRelationship_id_seq";

-- AlterTable
ALTER TABLE "CharacterType" DROP CONSTRAINT "CharacterType_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "CharacterType_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "CharacterType_id_seq";

-- AlterTable
ALTER TABLE "Clothes" DROP CONSTRAINT "Clothes_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Clothes_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Clothes_id_seq";

-- AlterTable
ALTER TABLE "Conflict" DROP CONSTRAINT "Conflict_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "eraId" SET DATA TYPE TEXT,
ALTER COLUMN "attackgroupid" SET DATA TYPE TEXT,
ALTER COLUMN "defensiveGroupId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Conflict_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Conflict_id_seq";

-- AlterTable
ALTER TABLE "Era" DROP CONSTRAINT "Era_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "projectId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Era_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Era_id_seq";

-- AlterTable
ALTER TABLE "Event" DROP CONSTRAINT "Event_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "eraId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Event_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Event_id_seq";

-- AlterTable
ALTER TABLE "ExcerptCharacter" DROP CONSTRAINT "ExcerptCharacter_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "excerptId" SET DATA TYPE TEXT,
ALTER COLUMN "characterProgressionId" SET DATA TYPE TEXT,
ADD CONSTRAINT "ExcerptCharacter_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "ExcerptCharacter_id_seq";

-- AlterTable
ALTER TABLE "Family" DROP CONSTRAINT "Family_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Family_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Family_id_seq";

-- AlterTable
ALTER TABLE "Group" DROP CONSTRAINT "Group_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "projectId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Group_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Group_id_seq";

-- AlterTable
ALTER TABLE "ImageExcerpt" DROP CONSTRAINT "ImageExcerpt_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "imageId" SET DATA TYPE TEXT,
ALTER COLUMN "characterProgressionId" SET DATA TYPE TEXT,
ADD CONSTRAINT "ImageExcerpt_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "ImageExcerpt_id_seq";

-- AlterTable
ALTER TABLE "NickNames" DROP CONSTRAINT "NickNames_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "characterId" SET DATA TYPE TEXT,
ADD CONSTRAINT "NickNames_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "NickNames_id_seq";

-- AlterTable
ALTER TABLE "Occupation" DROP CONSTRAINT "Occupation_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "projectId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Occupation_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Occupation_id_seq";

-- AlterTable
ALTER TABLE "Panel" DROP CONSTRAINT "Panel_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "chapterId" SET DATA TYPE TEXT,
ALTER COLUMN "placeId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Panel_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Panel_id_seq";

-- AlterTable
ALTER TABLE "Place" DROP CONSTRAINT "Place_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "projectId" SET DATA TYPE TEXT,
ALTER COLUMN "ownedByCharacterId" SET DATA TYPE TEXT,
ALTER COLUMN "ownedByFamilyId" SET DATA TYPE TEXT,
ALTER COLUMN "ownedByGroupId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Place_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Place_id_seq";

-- AlterTable
ALTER TABLE "PlaceImage" DROP CONSTRAINT "PlaceImage_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "subPlaceId" SET DATA TYPE TEXT,
ADD CONSTRAINT "PlaceImage_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "PlaceImage_id_seq";

-- AlterTable
ALTER TABLE "PowerMove" DROP CONSTRAINT "PowerMove_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "powerTypeId" SET DATA TYPE TEXT,
ADD CONSTRAINT "PowerMove_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "PowerMove_id_seq";

-- AlterTable
ALTER TABLE "PowerMoveImage" DROP CONSTRAINT "PowerMoveImage_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "powerMoveId" SET DATA TYPE TEXT,
ADD CONSTRAINT "PowerMoveImage_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "PowerMoveImage_id_seq";

-- AlterTable
ALTER TABLE "PowerSystem" DROP CONSTRAINT "PowerSystem_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "PowerSystem_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "PowerSystem_id_seq";

-- AlterTable
ALTER TABLE "PowerType" DROP CONSTRAINT "PowerType_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "powerSystemId" SET DATA TYPE TEXT,
ADD CONSTRAINT "PowerType_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "PowerType_id_seq";

-- AlterTable
ALTER TABLE "Project" DROP CONSTRAINT "Project_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "createdById" SET DATA TYPE TEXT,
ADD CONSTRAINT "Project_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Project_id_seq";

-- AlterTable
ALTER TABLE "ProjectRight" DROP CONSTRAINT "ProjectRight_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "projectId" SET DATA TYPE TEXT,
ALTER COLUMN "userId" SET DATA TYPE TEXT,
ALTER COLUMN "roleId" SET DATA TYPE TEXT,
ADD CONSTRAINT "ProjectRight_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "ProjectRight_id_seq";

-- AlterTable
ALTER TABLE "Role" DROP CONSTRAINT "Role_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Role_id_seq";

-- AlterTable
ALTER TABLE "RolePermission" DROP CONSTRAINT "RolePermission_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "roleId" SET DATA TYPE TEXT,
ADD CONSTRAINT "RolePermission_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "RolePermission_id_seq";

-- AlterTable
ALTER TABLE "SubPlace" DROP CONSTRAINT "SubPlace_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "placeId" SET DATA TYPE TEXT,
ADD CONSTRAINT "SubPlace_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "SubPlace_id_seq";

-- AlterTable
ALTER TABLE "SubPlaceProgression" DROP CONSTRAINT "SubPlaceProgression_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "subPlaceId" SET DATA TYPE TEXT,
ADD CONSTRAINT "SubPlaceProgression_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "SubPlaceProgression_id_seq";

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "User_id_seq";

-- AlterTable
ALTER TABLE "_ArcToPlace" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_CharacterProgressionToClothes" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_CharacterProgressionToGroup" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_CharacterToFamily" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "_CharacterToPowerMove" ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT;

-- CreateTable
CREATE TABLE "VerificationRequest" (
    "id" TEXT NOT NULL,
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VerificationRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "providerType" TEXT NOT NULL,
    "providerId" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refreshToken" TEXT,
    "accessToken" TEXT,
    "accessTokenExpires" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "accessToken" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "VerificationRequest_token_key" ON "VerificationRequest"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationRequest_identifier_token_key" ON "VerificationRequest"("identifier", "token");

-- CreateIndex
CREATE UNIQUE INDEX "Account_providerId_providerAccountId_key" ON "Account"("providerId", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "Session_accessToken_key" ON "Session"("accessToken");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolePermission" ADD CONSTRAINT "RolePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectRight" ADD CONSTRAINT "ProjectRight_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectRight" ADD CONSTRAINT "ProjectRight_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectRight" ADD CONSTRAINT "ProjectRight_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Arc" ADD CONSTRAINT "Arc_eraId_fkey" FOREIGN KEY ("eraId") REFERENCES "Era"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_eraId_fkey" FOREIGN KEY ("eraId") REFERENCES "Era"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NickNames" ADD CONSTRAINT "NickNames_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Occupation" ADD CONSTRAINT "Occupation_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterProgression" ADD CONSTRAINT "CharacterProgression_occupationId_fkey" FOREIGN KEY ("occupationId") REFERENCES "Occupation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterProgression" ADD CONSTRAINT "CharacterProgression_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterProgression" ADD CONSTRAINT "CharacterProgression_characterTypeId_fkey" FOREIGN KEY ("characterTypeId") REFERENCES "CharacterType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterRelationship" ADD CONSTRAINT "CharacterRelationship_characterProgressionId_fkey" FOREIGN KEY ("characterProgressionId") REFERENCES "CharacterProgression"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterRelationship" ADD CONSTRAINT "CharacterRelationship_relatedCharacterProgressionId_fkey" FOREIGN KEY ("relatedCharacterProgressionId") REFERENCES "CharacterProgression"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chapter" ADD CONSTRAINT "Chapter_arcId_fkey" FOREIGN KEY ("arcId") REFERENCES "Arc"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Panel" ADD CONSTRAINT "Panel_chapterId_fkey" FOREIGN KEY ("chapterId") REFERENCES "Chapter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Panel" ADD CONSTRAINT "Panel_placeId_fkey" FOREIGN KEY ("placeId") REFERENCES "SubPlace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageExcerpt" ADD CONSTRAINT "ImageExcerpt_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Panel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageExcerpt" ADD CONSTRAINT "ImageExcerpt_characterProgressionId_fkey" FOREIGN KEY ("characterProgressionId") REFERENCES "CharacterProgression"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChapterExcerpt" ADD CONSTRAINT "ChapterExcerpt_chapterId_fkey" FOREIGN KEY ("chapterId") REFERENCES "Chapter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExcerptCharacter" ADD CONSTRAINT "ExcerptCharacter_excerptId_fkey" FOREIGN KEY ("excerptId") REFERENCES "ChapterExcerpt"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExcerptCharacter" ADD CONSTRAINT "ExcerptCharacter_characterProgressionId_fkey" FOREIGN KEY ("characterProgressionId") REFERENCES "CharacterProgression"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Place" ADD CONSTRAINT "Place_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Place" ADD CONSTRAINT "Place_ownedByCharacterId_fkey" FOREIGN KEY ("ownedByCharacterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Place" ADD CONSTRAINT "Place_ownedByFamilyId_fkey" FOREIGN KEY ("ownedByFamilyId") REFERENCES "Family"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Place" ADD CONSTRAINT "Place_ownedByGroupId_fkey" FOREIGN KEY ("ownedByGroupId") REFERENCES "Group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubPlace" ADD CONSTRAINT "SubPlace_placeId_fkey" FOREIGN KEY ("placeId") REFERENCES "Place"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Era" ADD CONSTRAINT "Era_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubPlaceProgression" ADD CONSTRAINT "SubPlaceProgression_subPlaceId_fkey" FOREIGN KEY ("subPlaceId") REFERENCES "SubPlace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterImage" ADD CONSTRAINT "CharacterImage_characterProgressionId_fkey" FOREIGN KEY ("characterProgressionId") REFERENCES "CharacterProgression"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlaceImage" ADD CONSTRAINT "PlaceImage_subPlaceId_fkey" FOREIGN KEY ("subPlaceId") REFERENCES "SubPlaceProgression"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PowerType" ADD CONSTRAINT "PowerType_powerSystemId_fkey" FOREIGN KEY ("powerSystemId") REFERENCES "PowerSystem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PowerMove" ADD CONSTRAINT "PowerMove_powerTypeId_fkey" FOREIGN KEY ("powerTypeId") REFERENCES "PowerType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PowerMoveImage" ADD CONSTRAINT "PowerMoveImage_powerMoveId_fkey" FOREIGN KEY ("powerMoveId") REFERENCES "PowerMove"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Conflict" ADD CONSTRAINT "Conflict_eraId_fkey" FOREIGN KEY ("eraId") REFERENCES "Era"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Conflict" ADD CONSTRAINT "Conflict_attackgroupid_fkey" FOREIGN KEY ("attackgroupid") REFERENCES "Group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Conflict" ADD CONSTRAINT "Conflict_defensiveGroupId_fkey" FOREIGN KEY ("defensiveGroupId") REFERENCES "Group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtifactsAndWeapons" ADD CONSTRAINT "ArtifactsAndWeapons_ownedByGroupId_fkey" FOREIGN KEY ("ownedByGroupId") REFERENCES "Group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtifactsAndWeapons" ADD CONSTRAINT "ArtifactsAndWeapons_ownedByCharacterId_fkey" FOREIGN KEY ("ownedByCharacterId") REFERENCES "CharacterProgression"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtifactsAndWeapons" ADD CONSTRAINT "ArtifactsAndWeapons_ownedByFamilyId_fkey" FOREIGN KEY ("ownedByFamilyId") REFERENCES "Family"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_eraId_fkey" FOREIGN KEY ("eraId") REFERENCES "Era"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArcToPlace" ADD CONSTRAINT "_ArcToPlace_A_fkey" FOREIGN KEY ("A") REFERENCES "Arc"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArcToPlace" ADD CONSTRAINT "_ArcToPlace_B_fkey" FOREIGN KEY ("B") REFERENCES "Place"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFamily" ADD CONSTRAINT "_CharacterToFamily_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFamily" ADD CONSTRAINT "_CharacterToFamily_B_fkey" FOREIGN KEY ("B") REFERENCES "Family"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToPowerMove" ADD CONSTRAINT "_CharacterToPowerMove_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToPowerMove" ADD CONSTRAINT "_CharacterToPowerMove_B_fkey" FOREIGN KEY ("B") REFERENCES "PowerMove"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterProgressionToClothes" ADD CONSTRAINT "_CharacterProgressionToClothes_A_fkey" FOREIGN KEY ("A") REFERENCES "CharacterProgression"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterProgressionToClothes" ADD CONSTRAINT "_CharacterProgressionToClothes_B_fkey" FOREIGN KEY ("B") REFERENCES "Clothes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterProgressionToGroup" ADD CONSTRAINT "_CharacterProgressionToGroup_A_fkey" FOREIGN KEY ("A") REFERENCES "CharacterProgression"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterProgressionToGroup" ADD CONSTRAINT "_CharacterProgressionToGroup_B_fkey" FOREIGN KEY ("B") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;
