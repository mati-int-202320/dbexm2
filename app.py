from flask import Flask
import psycopg2

app = Flask(__name__)

@app.route('/')
def get_data():
    try:
        conn = psycopg2.connect(
            database="mydb",
            user="myuser",
            password="mypassword",
            host="postgresql",
            port="5432",
        )

        cursor = conn.cursor()
        cursor.execute("SELECT * FROM CIUDADANO")
        data = cursor.fetchall()

        return str(data)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        conn.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
