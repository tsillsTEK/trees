# Use an official Python runtime as a parent image
FROM python:3.9.10-slim

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

# Make port 80 available to the world outside this container
EXPOSE 8080

CMD ["python", "app.py"]
# Set the working directory to /app
#WORKDIR infrastructure/Docker-Application
#
## Install any needed packages specified in requirements.txt
#RUN pip freeze  > requirements.txt .
#
## Copy the current directory contents into the container at /app
##ADD . /app --trusted-host pypi.python.org
#COPY app.py .
# Define environment variable
#ENV NAME World

