-- CreateTable
CREATE TABLE "Alert" (
    "id" SERIAL NOT NULL,
    "staffId" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "emailBody" TEXT NOT NULL,
    "smsBody" TEXT NOT NULL,
    "publishDate" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Message" (
    "id" SERIAL NOT NULL,
    "alertId" INTEGER NOT NULL,
    "subscriptionId" INTEGER NOT NULL,
    "sentDate" TIMESTAMP(3) NOT NULL,
    "deliveryStatusUpdatedDate" TIMESTAMP(3) NOT NULL,
    "deiveryStatusId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "id" SERIAL NOT NULL,
    "emailAddress" TEXT,
    "isEmailVerified" BOOLEAN NOT NULL DEFAULT false,
    "phoneNumber" TEXT,
    "phonePrefix" TEXT,
    "isPhoneVerified" BOOLEAN NOT NULL DEFAULT false,
    "channelId" TEXT NOT NULL,
    "countryCode" TEXT NOT NULL,
    "subscribeDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "unsubscribeDate" TIMESTAMP(3),
    "lastUpdatedDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "unsubscribeReasonId" INTEGER,
    "isBritishNational" BOOLEAN NOT NULL,
    "isGlobalSubscriber" BOOLEAN DEFAULT false,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Staff" (
    "id" SERIAL NOT NULL,
    "emailAddress" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "givenName" TEXT NOT NULL,
    "roleId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffRole" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeliveryStatus" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Channel" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,

    PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "UnsubscribeReason" (
    "id" SERIAL NOT NULL,
    "categoryId" INTEGER,
    "textDescription" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnsubscribeReasonCategory" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Alert" ADD FOREIGN KEY ("staffId") REFERENCES "Staff"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD FOREIGN KEY ("alertId") REFERENCES "Alert"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD FOREIGN KEY ("subscriptionId") REFERENCES "Subscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD FOREIGN KEY ("deiveryStatusId") REFERENCES "DeliveryStatus"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD FOREIGN KEY ("channelId") REFERENCES "Channel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD FOREIGN KEY ("countryCode") REFERENCES "Country"("code") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD FOREIGN KEY ("unsubscribeReasonId") REFERENCES "UnsubscribeReason"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Staff" ADD FOREIGN KEY ("roleId") REFERENCES "StaffRole"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnsubscribeReason" ADD FOREIGN KEY ("categoryId") REFERENCES "UnsubscribeReasonCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;
