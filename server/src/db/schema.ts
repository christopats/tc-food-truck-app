import { integer, sqliteTable, text } from "drizzle-orm/sqlite-core";

export const vendorsTable = sqliteTable("vendors_table", {
  id: integer().primaryKey({ autoIncrement: true }),
  name: text().notNull(),
  description: text().notNull(),
  email: text().notNull(),
});
