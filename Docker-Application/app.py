import flask
from flask import Flask

app = Flask(__name__, template_folder='templates')


@app.route('/')
@app.route('/index')
def index():
    name = 'Everyone!'
    return flask.render_template('index.html', username=name)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8080)
