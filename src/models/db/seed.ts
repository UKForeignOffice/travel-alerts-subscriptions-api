import { PrismaClient } from "@prisma/client";
import { Channel } from "../../constants";
import { logger } from "../../logger";
const prisma = new PrismaClient();

async function main() {
  await prisma.country.createMany({
    data: [
      {
        code: "IN",
        name: "India",
        slug: "india",
      },
      {
        code: "FR",
        name: "France",
        slug: "france",
      },
    ],
  });
  await prisma.channel.createMany({
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
  await prisma.unsubscribeReasonCategory.createMany({
    data: [
      {
        description: "My trip to the country is finished",
      },
      {
        description: "The alert message contents weren't useful to me",
      },
      {
        description: "An unsubscribe date was set when subscribing",
      },
    ],
  });
  const categories = await prisma.unsubscribeReasonCategory.findMany();
  await prisma.unsubscribeReason.createMany({
    data: categories.map(({ id }) => ({ categoryId: id })),
  });
}

main()
  .catch((e) => {
    logger.error(e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
