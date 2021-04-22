import { PrismaClient } from "@prisma/client";
import { Channel } from "../../constants";
import { logger } from "../../logger";
const prisma = new PrismaClient();

async function main() {
  const country = await prisma.country.create({
    data: {
      code: "GB",
      name: "Great Britain",
      slug: "great-britain",
    },
  });
  const channel = await prisma.channel.createMany({
    data: [
      {
        id: Channel.Email,
        description: "Email",
      },
      {
        id: Channel.Sms,
        description: "SMS",
      },
    ],
  });
  logger.info({ country, channel });
}

main()
  .catch((e) => {
    logger.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
