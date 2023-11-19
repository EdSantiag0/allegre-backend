/*
  Warnings:

  - Added the required column `role` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('SUPER_ADMIN', 'ORG_ADMIN', 'ORG_MEMBER', 'ORG_TEACHER', 'ORG_PARENT', 'ORG_STUDENT');

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_organizationID_fkey";

-- AlterTable
ALTER TABLE "user" ADD COLUMN     "role" "UserRole" NOT NULL,
ALTER COLUMN "organizationID" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_organizationID_fkey" FOREIGN KEY ("organizationID") REFERENCES "organization"("id") ON DELETE SET NULL ON UPDATE CASCADE;
