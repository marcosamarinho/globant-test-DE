from fastapi import FastAPI
from fastapi import File, UploadFile
from fastapi import Response , status 
import os 
import subprocess
import sys
import shlex

# memory limit use 1Mb at time 
CHUNK_SIZE=1024*1024
STAGE_DIR="/tmp/stage"

app = FastAPI(root_path="/api/v1")
#, root_path_in_servers=False)


@app.post("/api/v1/upload", status_code=200)
def upload(response:Response, file: UploadFile = File(...)):

   ALLOWED_EXTENSIONS = {'csv'} 
   def allowed_file(filename):
       return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS 
   if not os.path.exists(STAGE_DIR):
      os.makedirs(STAGE_DIR)
   stage_file=os.path.join(STAGE_DIR, file.filename) 
   try:
      with open(stage_file, 'wb') as f:
         # use chunks to limit memory usage on larger files 
         while contents := file.file.read(CHUNK_SIZE):
            f.write(contents)
   except Exception:
      response.status_code = status.HTTP_400_BAD_REQUEST
      return {"error": "Error uploading file"}
   finally:
      file.file.close()
   table=file.filename.split('.')[0]
   message=f"Table db.{table} loaded"
   cwd=os.getcwd()
   try: 
      #  call clp
      CMD=f"scripts/load_table.sh {STAGE_DIR} db {table}"
      if os.getcwd().startswith('/code') :
         # Docker 
         CMD=f"./{CMD}"
      else: 
         CMD=f"../../{CMD}"
      proc = subprocess.Popen(CMD, stdout=subprocess.PIPE, stderr=subprocess.PIPE,shell=True)
      out, err = proc.communicate()
      exitcode = proc.returncode 
      if exitcode != 0 :
         raise Exception( f"Error running script {CMD} return_code={exitcode} stderr={err} ") 
#   except subprocess.CalledProcessError as e:
   except Exception as e:
      response.status_code = status.HTTP_400_BAD_REQUEST
      message= f"Error loading table {cwd} {table} {e}"
   finally:
      # delete uploaded file
      os.remove(stage_file)
   return {"message": message }
