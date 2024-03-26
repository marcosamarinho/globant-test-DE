# 
# Create image FastAPI and install mariadb client to allow runs native load 
FROM python:3.9

# 
WORKDIR /code

# 
COPY ./FastAPI/requirements.txt /code/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
# INSTALL mysql client
RUN apt-get update && apt-get install -y \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*
# 
COPY ./FastAPI/app /code/app
COPY ./scripts /code/scripts
#COPY ./data /code/data

# 
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
#CMD ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "80"]
