import { readdirSync, readFileSync } from "fs"
import Repository from "../lib/repository.js"
import { table } from "console"
import { t_string } from "../lib/util.js"

class MigrationRepository extends Repository {
	protected table_name: string = "last_migration"
	protected fields = [ "migration" ]

	private migration_folder = "migrations"
	private migrations: string[]

	constructor() {
		super()
		this.migrations = readdirSync(this.migration_folder)
	}

	private up() {
		this._query = `CREATE TABLE IF NOT EXISTS ${this.table_name} (
			\`_id\` INTEGER PRIMARY KEY,
			\`created_at\` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
			\`migration\` TEXT
		)`
		return this
	}

	protected process_data({ migration }: any): string {
		return migration
	}

	protected update_migration(last_migration:string) {
		this._query = `INSERT OR IGNORE INTO ${this.table_name} (${this.primary_key}, migration) VALUES (1, ${t_string(last_migration)})
			ON CONFLICT(${this.primary_key}) DO UPDATE SET migration = ${t_string(last_migration)}`
		return this
	}

	public async load_migrations(argv:string|null = null) {
		try {
			this.migrations = readdirSync(this.migration_folder)

			if (argv) {
				const id = this.migrations.map(d => d.split("_")[0]).indexOf(argv)
				this.migrations = this.migrations.splice(id+1, this.migrations.length-1)
			}

			return
		}
		catch (err) {
			throw err
		}
	}

	private async undo_migrations() {
		try {
			console.log("Start Undo Migration")
			console.time()

			for (let i = this.migrations.length-1; i >= 0; i--) {
				const migration = this.migrations[i]

				try {
					const file_content = readFileSync(`./${this.migration_folder}/${migration}/down.sql`, { encoding: 'utf-8' })
					const queries = file_content.split(";")
					
					for (const query of queries) {
						this._query = query
						await this.do_it()
					}

					console.log(`Undo Migration Successfully: ${migration}`)
				}
				catch (err) {
					throw new Error(`Erro executing undo migration ${migration}: ${err}`)
				}
			}

			console.timeEnd()
			console.log("End Undo Migration")
		}
		catch (err) {
			throw err
		}
	}

	private async migrate() {
		try {
			console.log("Start Migration")
			console.time()

			for (const migration of this.migrations) {
				try {
					const file_content = readFileSync(`./${this.migration_folder}/${migration}/up.sql`, { encoding: 'utf-8' })
					const queries = file_content.split(";")
					
					for (const query of queries) {
						this._query = query
						await this.do_it()
					}

					await this.update_migration( migration.split("_")[0] ).do_it()
					console.log(`Migrate Succesfully: ${migration}`)
				}
				catch (err) {
					throw new Error(`Erro executing migration ${migration}: ${err}`)
				}
			}

			console.timeEnd()
			console.log("End Migration")
		}
		catch (err) {
			throw err
		}
	}

	public async go() {
		try {
			await this.up().do_it()
			const [argv = null] = await this
				.get_one_by_id(1)
				.read_it() as unknown as string[]

			await this.load_migrations(argv)

			if (this.migrations.length == 0) {
				console.log("> All migrations are done!")
				return
			}

			await this.migrate()
		} catch(err) {
			console.error(err)
		}
	}

	public async refresh(argv:string) {
		try {
			await this.up().do_it()
			await this.load_migrations(argv)
			await this.undo_migrations()
			await this.migrate()
		} catch(err) {
			console.error(err)
		}
	}
}

export default MigrationRepository