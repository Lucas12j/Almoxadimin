from flask import Flask, request, jsonify, json
import sqlite3

dir_bd = '/media/lucas/LINUX_STORAGE/Projetos/Almoxarifado/Api/almoxarifado'

def get_db_connection():
    con = sqlite3.connect(dir_bd)
    #con.row_factory = sqlite3.Row ENTENDER COMO FUNCIONA, PODE SER MAIS RÁPIDO
    con = con.cursor()
    return con

app = Flask(__name__)

@app.route('/loginVerify', methods=['POST'])
def loginVerify():
    cursor = get_db_connection()
    data = request.get_json()

    name = data['name']
    password = data['password']    
    list_verify = cursor.execute('select name, password from login').fetchall()

    cursor.close()

    if (name, password) in list_verify:
        return 'accepted', 200
    else:
        return 'not accepted', 201

@app.route('/showItems', methods=['GET'])
def showItem():

    cursor = get_db_connection()
    data = cursor.execute('select * from item')
    
    list_tuples = data.fetchall()
    list_json = [ {'name':tup[0], 'amont':tup[1], 'id':tup[2],'descr':tup[3]} for tup in list_tuples]
    cursor.close()

    return jsonify(list_json), 200




@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
    return response

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)


'''
@app.route('/addItem', methods=['POST'])
def addItem():
    cursor = get_db_connection()
    data = request.get_json()
    values = (data['name'], data['amont'], data['descr'])
    cursor.execute('insert into item (name, amont, descr) values '+str(values))

    cursor.commit()
    cursor.close()

    return 'ok', 200

@app.route('/show')
def login():
    cursor = get_db_connection()
    
    id = request.args.get('id')
    data = cursor.execute('select * from item where id == '+str(id))

    list_tuples = data.fetchall()
    list_json = [ {'name':tup[0], 'amont':tup[1], 'descr':tup[3]} for tup in list_tuples]

    cursor.close()

    return jsonify(list_json), 200
'''

