# server.py
# this not implements API yet but is alread works to test on browser  
# Created to develop web application using flask   
# 1- upload csv file to stage  
# 2- use file name to load at the database 
# 3- delete file if database load accomplished

from flask import Flask
import os
from flask import Flask, flash, request, redirect, url_for
from werkzeug.utils import secure_filename
import subprocess

# Stage DIR 
UPLOAD_FOLDER = '/tmp/stage'
ALLOWED_EXTENSIONS = {'csv'}

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route("/" , methods=['GET','POST'])
def upload_file():
    last=''
    if request.method == 'POST':
        if not os.path.exists(UPLOAD_FOLDER):
           os.makedirs(UPLOAD_FOLDER)
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        # If the user does not select a file, the browser submits an
        # empty file without a filename.
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            save_file=os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(save_file)
            table=filename.split('.')[0]
            #  call clp 
            CMD=f"bash ../load_table.sh {UPLOAD_FOLDER} db {table}"
            return_code = subprocess.call(CMD, shell=True) 
            if return_code != 0 :
               return f"""ERROR={return_code}"""
            else : 
               # delete uploaded file
               os.remove(save_file)
               last=f"""Table={table} LOADED""" 
    return f'''
    <!doctype html>
    <title>Upload new File</title>
    <html>
    <h1> Upload CSV File</h1>
    {last}
    <form method=post enctype=multipart/form-data>
      <input type=file name=file>
      <input type=submit value=Upload>
    </form>
    </html>
    '''
