import { appendFileSync } from "fs"

class Log {
    private static log_file: string = process.env.LOG_FILE || ".log"

    public static write(err:Error) {
        const text = `${new Date()} | ${err.message}`
        console.error(err)
        appendFileSync(Log.log_file, text)
    }
}

export default Log