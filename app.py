from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

# Sample data (replace with your actual data retrieval logic)
data = {
    "1": {"TIPOIDENTIFICACION": "1", "NUMEROIDENTIFICACION": "12345", "FECHAEXPEDICION": "2023-09-15", "name": "John", "last_name": "Doe"},
    "2": {"TIPOIDENTIFICACION": "2", "NUMEROIDENTIFICACION": "67890", "FECHAEXPEDICION": "2023-09-16", "name": "Jane", "last_name": "Smith"},
}

def get_operator_data(TIPOIDENTIFICACION, NUMEROIDENTIFICACION):
    # Add your PostgreSQL database connection code here
    try:
        conn = psycopg2.connect(
            database="mydb",
            user="myuser",
            password="mypassword",
            host="postgresql",
            port="5432",
        )

        cursor = conn.cursor()
        cursor.execute("SELECT * FROM your_table WHERE TIPOIDENTIFICACION=%s AND NUMEROIDENTIFICACION=%s", (TIPOIDENTIFICACION, NUMEROIDENTIFICACION))
        operator_data = cursor.fetchone()

        if operator_data:
            return {
                "TIPOIDENTIFICACION": operator_data[1],
                "NUMEROIDENTIFICACION": operator_data[2],
                "FECHAEXPEDICION": operator_data[3],
                "name": operator_data[4],
                "last_name": operator_data[5]
            }
        else:
            return None
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        conn.close()

@app.route('/operador/consultar/<TIPOIDENTIFICACION>/<NUMEROIDENTIFICACION>', methods=['GET'])
def consultar_operador(TIPOIDENTIFICACION, NUMEROIDENTIFICACION):
    # Check if TIPOIDENTIFICACION and NUMEROIDENTIFICACION exist in the sample data
    operator_info = data.get(TIPOIDENTIFICACION, {}).get(NUMEROIDENTIFICACION)
    if operator_info:
        return jsonify(operator_info)
    else:
        # If not found in the sample data, try fetching from the database
        database_result = get_operator_data(TIPOIDENTIFICACION, NUMEROIDENTIFICACION)
        if database_result:
            return jsonify(database_result)
        else:
            return jsonify({"error": "Operador not found"}), 404

if __name__ == '__main__':
    app.run(debug=True)
