from flask import Flask, request, jsonify
from config import Config
from models import db, Persona

app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)


@app.route('/api/personas', methods=['GET'])
def get_personas():
    personas = Persona.query.all()
    return jsonify([p.to_dict() for p in personas])


@app.route('/api/personas/<int:id>', methods=['GET'])
def get_persona(id):
    persona = Persona.query.get_or_404(id)
    return jsonify(persona.to_dict())


@app.route('/api/personas', methods=['POST'])
def create_persona():
    data = request.get_json()
    persona = Persona(
        nombre=data['nombre'],
        apellido=data['apellido'],
        documento=data['documento'],
        direccion=data.get('direccion')
    )
    db.session.add(persona)
    db.session.commit()
    return jsonify(persona.to_dict()), 201


@app.route('/api/personas/<int:id>', methods=['PUT'])
def update_persona(id):
    persona = Persona.query.get_or_404(id)
    data = request.get_json()
    persona.nombre = data['nombre']
    persona.apellido = data['apellido']
    persona.documento = data['documento']
    persona.direccion = data.get('direccion')
    db.session.commit()
    return jsonify(persona.to_dict())


@app.route('/api/personas/<int:id>', methods=['PATCH'])
def patch_persona(id):
    persona = Persona.query.get_or_404(id)
    data = request.get_json()
    if 'nombre' in data:
        persona.nombre = data['nombre']
    if 'apellido' in data:
        persona.apellido = data['apellido']
    if 'documento' in data:
        persona.documento = data['documento']
    if 'direccion' in data:
        persona.direccion = data['direccion']
    db.session.commit()
    return jsonify(persona.to_dict())


@app.route('/api/personas/<int:id>', methods=['DELETE'])
def delete_persona(id):
    persona = Persona.query.get_or_404(id)
    db.session.delete(persona)
    db.session.commit()
    return '', 204


if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(debug=True)