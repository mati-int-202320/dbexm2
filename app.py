from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.exc import SQLAlchemyError

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://myuser:mypassword@postgresql:5432/mydb'
db = SQLAlchemy(app)

class Ciudadano(db.Model):
    __tablename__ = 'ciudadano'
    numero_identificacion = db.Column(db.Integer, primary_key=True)
    tipo_identificacion = db.Column(db.String(100))
    # ... other columns

@app.route('/consultar/<int:numero_identificacion>/<string:tipo_identificacion>', methods=['GET'])
def consultar_ciudadano(numero_identificacion, tipo_identificacion):
    try:
        ciudadano = Ciudadano.query.filter_by(numero_identificacion=numero_identificacion, tipo_identificacion=tipo_identificacion).first()
        if ciudadano:
            return jsonify({
                'numero_identificacion': ciudadano.numero_identificacion,
                'tipo_identificacion': ciudadano.tipo_identificacion,
                'fecha_expedicion': ciudadano.fecha_expedicion,
                # ... other fields
            })
        else:
            return jsonify({'message': 'Ciudadano not found'}), 404
    except SQLAlchemyError as e:
        return jsonify({'message': 'Error accessing the database'}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
