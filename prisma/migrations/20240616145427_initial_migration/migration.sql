-- CreateEnum
CREATE TYPE "GENDER" AS ENUM ('MALE', 'FEMALE', 'NONBINARY', 'UNKNOWN');

-- CreateEnum
CREATE TYPE "RELATIONSHIPS" AS ENUM ('FATHER', 'MOTHER', 'SON', 'DAUGHTER', 'BROTHER', 'SISTER', 'GRANDFATHER', 'GRANDMOTHER', 'GRANDSON', 'GRANDDAUGHTER', 'UNCLE', 'AUNT', 'NEPHEW', 'NIECE', 'COUSIN', 'STEPFATHER', 'STEPMOTHER', 'STEPSON', 'STEPDAUGHTER', 'STEPBROTHER', 'STEPSISTER', 'HALF_BROTHER', 'HALF_SISTER', 'FATHER_IN_LAW', 'MOTHER_IN_LAW', 'SON_IN_LAW', 'DAUGHTER_IN_LAW', 'BROTHER_IN_LAW', 'SISTER_IN_LAW', 'GODFATHER', 'GODMOTHER', 'GODSON', 'GODDAUGHTER', 'SPOUSE', 'HUSBAND', 'WIFE', 'FIANCE', 'FIANCEE', 'LOVER', 'PARTNER', 'EX_SPOUSE', 'EX_HUSBAND', 'EX_WIFE', 'EX_FIANCE', 'EX_FIANCEE', 'EX_LOVER', 'EX_PARTNER', 'CRUSH', 'ADMIRER', 'SUITOR', 'BOSS', 'EMPLOYEE', 'COWORKER', 'COLLEAGUE', 'MENTOR', 'MENTEE', 'TEACHER', 'STUDENT', 'MASTER', 'APPRENTICE', 'ADVISOR', 'ADVISEE', 'CLIENT', 'SERVICE_PROVIDER', 'BUSINESS_PARTNER', 'FRIEND', 'BEST_FRIEND', 'ACQUAINTANCE', 'NEIGHBOR', 'ROOMMATE', 'CLASSMATE', 'TEAMMATE', 'ENEMY', 'RIVAL', 'NEMESIS', 'OPPONENT', 'COMPETITOR', 'BULLY', 'VICTIM', 'RULER', 'SUBJECT', 'LEADER', 'FOLLOWER', 'SUPERIOR', 'SUBORDINATE', 'CAPTOR', 'CAPTIVE', 'SERVANT', 'GUARDIAN', 'WARD', 'ALLY', 'SIDEKICK', 'HENCHMAN', 'MINION', 'INFORMANT', 'BETRAYER', 'SAVIOR', 'RESCUER', 'RESCUEE', 'IDOL', 'FAN', 'INSPIRATION', 'SUCCESSOR', 'PREDECESSOR', 'PROTEGE', 'PATRON', 'STRANGER', 'UNKNOWN', 'CREATOR', 'CREATION', 'DEITY', 'WORSHIPPER', 'FAMILIAR', 'SHAPESHIFTER_ALTERNATE', 'CHILDHOOD_FRIEND', 'PAST_SELF', 'FUTURE_SELF', 'ANCESTOR', 'DESCENDANT', 'FELLOW_MEMBER', 'FELLOW_CITIZEN', 'COMPATRIOT', 'FELLOW_TRAVELER');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "signupType" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RolePermission" (
    "id" SERIAL NOT NULL,
    "roleId" INTEGER NOT NULL,
    "permissions" TEXT NOT NULL,

    CONSTRAINT "RolePermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "role" TEXT NOT NULL,
    "permissionId" INTEGER NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectRight" (
    "id" SERIAL NOT NULL,
    "projectId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "roleId" INTEGER NOT NULL,

    CONSTRAINT "ProjectRight_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "createdById" INTEGER NOT NULL,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Arc" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "backstory" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "projectId" INTEGER NOT NULL,
    "timeline" TEXT NOT NULL,

    CONSTRAINT "Arc_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Character" (
    "id" SERIAL NOT NULL,
    "projectId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "backstory" TEXT NOT NULL,
    "gender" "GENDER" NOT NULL,
    "isHuman" BOOLEAN NOT NULL,
    "earId" INTEGER NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Occupation" (
    "id" SERIAL NOT NULL,
    "projectId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Occupation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CharacterProgression" (
    "id" SERIAL NOT NULL,
    "age" INTEGER NOT NULL,
    "occupationId" INTEGER NOT NULL,
    "characterId" INTEGER NOT NULL,
    "characterTypeId" INTEGER NOT NULL,
    "goals" TEXT NOT NULL,
    "fears" TEXT NOT NULL,
    "desires" TEXT NOT NULL,

    CONSTRAINT "CharacterProgression_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Family" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "history" TEXT NOT NULL,

    CONSTRAINT "Family_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CharacterType" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "CharacterType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CharacterRelationship" (
    "id" SERIAL NOT NULL,
    "characterProgressionId" INTEGER NOT NULL,
    "relatedCharacterProgressionId" INTEGER NOT NULL,
    "relationship" "RELATIONSHIPS" NOT NULL,

    CONSTRAINT "CharacterRelationship_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Chapter" (
    "id" SERIAL NOT NULL,
    "arcId" INTEGER NOT NULL,
    "placeId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "number" INTEGER NOT NULL,

    CONSTRAINT "Chapter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Group" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "captain" INTEGER NOT NULL,
    "motto" TEXT NOT NULL,
    "isVillain" BOOLEAN NOT NULL DEFAULT false,
    "projectId" INTEGER NOT NULL,

    CONSTRAINT "Group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Panel" (
    "id" SERIAL NOT NULL,
    "chapterId" INTEGER NOT NULL,
    "imageIndex" INTEGER NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "placeId" INTEGER NOT NULL,

    CONSTRAINT "Panel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImageExcerpt" (
    "id" SERIAL NOT NULL,
    "imageId" INTEGER NOT NULL,
    "characterProgressionId" INTEGER NOT NULL,
    "imageRole" TEXT NOT NULL,

    CONSTRAINT "ImageExcerpt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChapterExcerpt" (
    "id" SERIAL NOT NULL,
    "chapterId" INTEGER NOT NULL,
    "excerptIndex" INTEGER NOT NULL,
    "excerpt" TEXT NOT NULL,

    CONSTRAINT "ChapterExcerpt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExcerptCharacter" (
    "id" SERIAL NOT NULL,
    "excerptId" INTEGER NOT NULL,
    "characterProgressionId" INTEGER NOT NULL,
    "role" TEXT NOT NULL,

    CONSTRAINT "ExcerptCharacter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Place" (
    "id" SERIAL NOT NULL,
    "projectId" INTEGER NOT NULL,
    "history" TEXT NOT NULL,
    "ownedByCharacterId" INTEGER NOT NULL,
    "ownedByFamilyId" INTEGER NOT NULL,
    "ownedByGroupId" INTEGER NOT NULL,

    CONSTRAINT "Place_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubPlace" (
    "id" SERIAL NOT NULL,
    "placeId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "history" TEXT NOT NULL,

    CONSTRAINT "SubPlace_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Era" (
    "id" SERIAL NOT NULL,
    "projectId" INTEGER NOT NULL,
    "timeline" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "significantEvents" TEXT NOT NULL,

    CONSTRAINT "Era_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubPlaceProgression" (
    "id" SERIAL NOT NULL,
    "subPlaceId" INTEGER NOT NULL,
    "era" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "history" TEXT NOT NULL,

    CONSTRAINT "SubPlaceProgression_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CharacterImage" (
    "id" SERIAL NOT NULL,
    "characterProgressionId" INTEGER NOT NULL,
    "imageUrl" TEXT NOT NULL,

    CONSTRAINT "CharacterImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlaceImage" (
    "id" SERIAL NOT NULL,
    "subPlaceId" INTEGER NOT NULL,
    "imageUrl" TEXT NOT NULL,

    CONSTRAINT "PlaceImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Clothes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "Clothes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PowerSystem" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "history" TEXT NOT NULL,
    "explanation" TEXT NOT NULL,

    CONSTRAINT "PowerSystem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PowerType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "history" TEXT NOT NULL,
    "explanation" TEXT NOT NULL,
    "powerSystemId" INTEGER NOT NULL,

    CONSTRAINT "PowerType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PowerMove" (
    "id" SERIAL NOT NULL,
    "powerTypeId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "history" TEXT NOT NULL,
    "limitations" TEXT NOT NULL,
    "sideEffects" TEXT NOT NULL,
    "createdById" INTEGER NOT NULL,
    "explanation" TEXT NOT NULL,

    CONSTRAINT "PowerMove_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PowerMoveImage" (
    "id" SERIAL NOT NULL,
    "powerMoveId" INTEGER NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "PowerMoveImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Conflict" (
    "id" SERIAL NOT NULL,
    "eraId" INTEGER NOT NULL,
    "history" TEXT NOT NULL,
    "attackgroupid" INTEGER NOT NULL,
    "attackMotivation" TEXT NOT NULL,
    "defensiveGroupId" INTEGER NOT NULL,

    CONSTRAINT "Conflict_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtifactsAndWeapons" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "speciality" TEXT NOT NULL,
    "ownedByGroupId" INTEGER NOT NULL,
    "ownedByFamilyId" INTEGER NOT NULL,
    "ownedByCharacterId" INTEGER NOT NULL,

    CONSTRAINT "ArtifactsAndWeapons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Event" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "eraId" INTEGER NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ArcToPlace" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterToFamily" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterToPowerMove" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterProgressionToClothes" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CharacterProgressionToGroup" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "ProjectRight_projectId_idx" ON "ProjectRight"("projectId");

-- CreateIndex
CREATE INDEX "ProjectRight_userId_idx" ON "ProjectRight"("userId");

-- CreateIndex
CREATE INDEX "Project_createdById_idx" ON "Project"("createdById");

-- CreateIndex
CREATE INDEX "Character_projectId_idx" ON "Character"("projectId");

-- CreateIndex
CREATE INDEX "CharacterRelationship_characterProgressionId_idx" ON "CharacterRelationship"("characterProgressionId");

-- CreateIndex
CREATE INDEX "CharacterRelationship_relatedCharacterProgressionId_idx" ON "CharacterRelationship"("relatedCharacterProgressionId");

-- CreateIndex
CREATE INDEX "Chapter_arcId_idx" ON "Chapter"("arcId");

-- CreateIndex
CREATE INDEX "Group_projectId_idx" ON "Group"("projectId");

-- CreateIndex
CREATE INDEX "Panel_chapterId_idx" ON "Panel"("chapterId");

-- CreateIndex
CREATE INDEX "ImageExcerpt_imageId_idx" ON "ImageExcerpt"("imageId");

-- CreateIndex
CREATE INDEX "ImageExcerpt_characterProgressionId_idx" ON "ImageExcerpt"("characterProgressionId");

-- CreateIndex
CREATE INDEX "ChapterExcerpt_chapterId_idx" ON "ChapterExcerpt"("chapterId");

-- CreateIndex
CREATE INDEX "ExcerptCharacter_excerptId_idx" ON "ExcerptCharacter"("excerptId");

-- CreateIndex
CREATE INDEX "ExcerptCharacter_characterProgressionId_idx" ON "ExcerptCharacter"("characterProgressionId");

-- CreateIndex
CREATE UNIQUE INDEX "_ArcToPlace_AB_unique" ON "_ArcToPlace"("A", "B");

-- CreateIndex
CREATE INDEX "_ArcToPlace_B_index" ON "_ArcToPlace"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToFamily_AB_unique" ON "_CharacterToFamily"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToFamily_B_index" ON "_CharacterToFamily"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToPowerMove_AB_unique" ON "_CharacterToPowerMove"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToPowerMove_B_index" ON "_CharacterToPowerMove"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterProgressionToClothes_AB_unique" ON "_CharacterProgressionToClothes"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterProgressionToClothes_B_index" ON "_CharacterProgressionToClothes"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterProgressionToGroup_AB_unique" ON "_CharacterProgressionToGroup"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterProgressionToGroup_B_index" ON "_CharacterProgressionToGroup"("B");

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
ALTER TABLE "Arc" ADD CONSTRAINT "Arc_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Era"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_earId_fkey" FOREIGN KEY ("earId") REFERENCES "Era"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

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
