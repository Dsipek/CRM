FROM python:3.10-slim

# Install pkg-config
RUN apt-get update && apt-get install -y pkg-config python3-dev default-libmysqlclient-dev build-essential

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /dcrm

# Install dependencies
COPY requirements.txt /dcrm/
RUN pip install --no-cache-dir -r requirements.txt

# Install gunicorn
RUN pip install gunicorn

# Copy the current directory contents into the container at /dcrm
COPY . /dcrm/

COPY start.sh /dcrm/
RUN chmod +x /dcrm/start.sh

# Run the Django development server
RUN chmod +x start.sh
ENTRYPOINT [ "./start.sh" ]
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
