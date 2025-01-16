import { createClient } from "@libsql/client"

class Connection {
	static open() {
		if (process.env.MODE == "production") {
			return createClient({
				url: process.env.TURSO_DATABASE_URL!,
				authToken: process.env.TURSO_AUTH_TOKEN
			})
		}
		else {
			return createClient({
				url: `file:${process.env.DEV_DB!}`
			})
		}
	}
}

export default Connection