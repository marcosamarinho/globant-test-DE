curl -X 'POST' \
  'http://localhost:9000/upload' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'file=@../data/jobs.csv;type=text/csv'
curl -X 'POST' \
  'http://localhost:9000/upload' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'file=@../data/hired_employees.csv;type=text/csv'
curl -X 'POST' \
  'http://localhost:9000/upload' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'file=@../data/departments.csv;type=text/csv'
