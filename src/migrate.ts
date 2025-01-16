import MigrationRepository from "./repositories/migrationRepository.js"
import dotenv from 'dotenv'

dotenv.config()

const migration = new MigrationRepository()

switch (process.argv[2]) {
	case "refresh":
		migration.refresh(process.argv[3])
		break

	case "go":
		migration.go()
		break

	default:
		console.log("Error: pass a command please!")
		break
}