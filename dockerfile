
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apt-get update && apt-get install -y default-libmysqlclient-dev gcc \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirement.txt

# Copy project code
COPY . /app/

# Expose port 8000 to the host
EXPOSE 8000

# Default command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "ExpenseTracker.wsgi:application"]


