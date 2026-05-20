import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return '¡Hola Mundo desde Docker, Cloud Build y Cloud Run!'

if __name__ == "__main__":
    # Cloud Run define automáticamente la variable de entorno PORT
    port = int(os.environ.get('PORT', 8080))
    app.run(debug=True, host='0.0.0.0', port=port)
