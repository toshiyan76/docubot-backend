FROM python:3.11-slim

WORKDIR /app/backend

COPY pyproject.toml ./

RUN pip install --no-cache-dir -e .

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
