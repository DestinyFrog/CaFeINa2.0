import { Row } from "@libsql/client"
import Connection from "../db/Connection.js"

export enum CONDITION {
	GREATER = ">",
	LOWER = "<",
	GREATER_EQUAL = ">=",
	LOWER_EQUAL = "<=",
	EQUAL = "=",
	DIFERENT = "!=",
	LIKE = "LIKE"
}

class Repository {
	protected _query = ""
	private _conditions: string[] = []

	protected table_name: string = ""
	protected primary_key: string = "_id"
	protected created_at: string = "created_at"
	protected fields: string[] = []

	constructor() {
		this.reset_query()
	}

	protected process_data(d:Row) {
		throw new Error("Process Data is not defined!")
	}

	reset_query() {
		this._query = ""
		this.reset_conditions()
	}

	reset_conditions() {
		this._conditions = []
	}

	protected get_my_fields() {
		const _fields = this.fields
		_fields.push(this.primary_key)
		_fields.push(this.created_at)
		return _fields.map(d => `\`${this.table_name}\`.\`${d}\``).join(",")
	}

	public get_all() {
		const fields = this.get_my_fields()
		this._query = `SELECT ${fields} FROM ${this.table_name} ${this._query}`
		return this
	}

	public get_one_by_id(id:number) {
		const fields = this.get_my_fields()
		this._query = `SELECT ${fields} FROM ${this.table_name} WHERE ${this.primary_key} = ${id} ${this._query}`
		return this
	}

	public get_one_by(field:string, value:string|number) {
		const fields = this.get_my_fields()
		this._query = `SELECT ${fields} FROM ${this.table_name} WHERE ${field} = ${value} ${this._query}`
		return this
	}

	public order_by(field:string, order:'ASC'|'DESC' = 'ASC') {
		this._query = `ORDER BY ${field} ${order} ${this._query}`
		return this
	}

	public condition(field:string, condition:CONDITION = CONDITION.EQUAL, value:any, and_or?:"AND"|"OR") {
		this._conditions.push(`${field} ${condition} ${value}`)
		if (and_or) {
			this._conditions.push(and_or)
		}
		return this
	}

	public where() {
		this._query = `WHERE ${this._conditions.join(" ")} ${this._query}`
		return this
	}

	public insert(values:Object) {
		const fields = Object.keys(values)
		this._query = `INSERT INTO ${this.table_name} (${fields.map(d => `\`${d}\``).join(',')}) VALUES (${Object.values(values).join(',')}) ${this._query}`
		return this
	}

	public update(primary_key:number) {
		this._query = `UPDATE FROM ${this.table_name} ${this._query} WHERE ${this.primary_key} = ${primary_key}`
		return this
	}

	public set(key:string, value:string|number) {
		this._query = `SET ${key} = ${value}`
		return this
	}

	public set_many(fields: [{key:string, value:string|number}]) {
		const fieldst = fields.map(({key, value}) => `${key} = ${value}`).join(",")
		this._query = `SET ${fieldst}`
		return this
	}

	public drop() {
		this._query = `DROP TABLE ${this.table_name} ${this._query}`
		return this
	}

	public async read_it(): Promise<unknown[]> {
		try {
			console.log("\n$_", this._query)
			const conn = Connection.open()
			const crude_data = await conn.execute(this._query)
			const data = crude_data.rows.map((d) => this.process_data(d))
			this.reset_query()
			return data
		}
		catch(err) {
			throw err
		}
	}

	public async do_it() {
		try {
			console.log("$_ ", this._query)
			const conn = Connection.open()
			await conn.execute(this._query)
			this.reset_query()
		}
		catch(err) {
			throw err
		}
	}
}

export default Repository