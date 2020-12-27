FROM python:3.10.0a3-buster

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . app.py /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 8000
EXPOSE 8000

# Run app.py at container launch
ENTRYPOINT FLASK_APP=/app/app.py flask run --host=0.0.0.0
