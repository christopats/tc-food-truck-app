import "dotenv/config";
import { drizzle } from "drizzle-orm/libsql";
import { eq } from "drizzle-orm";
import { vendorsTable } from "./db/schema";
import { createClient } from "@libsql/client";

async function main() {
  const client = createClient({
    url: process.env.TURSO_DATABASE_URL!,
    authToken: process.env.TURSO_AUTH_TOKEN!,
  });
  const db = drizzle({ client });

  const vendor: typeof vendorsTable.$inferInsert = {
    name: "Christophe dans le voiture",
    description: "Fine Frenche cusine a la car",
    email: "chris@food.com",
  };

  await db.insert(vendorsTable).values(vendor);
  console.log("New Vendor created");

  const vendors = await db.select().from(vendorsTable);
  console.log("Getting all vendors from Database: ", vendors);

  await db
    .update(vendorsTable)
    .set({
      email: "hello@food.com",
    })
    .where(eq(vendorsTable.email, vendor.email));
  console.log("Vendor info updated");

  await db.delete(vendorsTable).where(eq(vendorsTable.email, vendor.email));
  console.log("Vendor deleted");
}

main();
