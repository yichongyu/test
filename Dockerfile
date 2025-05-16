# Use official slim Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy app files
COPY requirements.txt /app/requirements.txt
COPY src/demo/test.py /app/src/demo/test.py

ENV PYTHONPATH="/app/src:${PYTHONPATH}"

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port FastAPI will run on
EXPOSE 8000

# Run the app with uvicorn
CMD ["uvicorn", "src.demo.test:app", "--host", "0.0.0.0", "--port", "8000"]
