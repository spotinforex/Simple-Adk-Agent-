FROM python:3.13-slim
WORKDIR /app

COPY requirement.txt .

RUN pip install --no-cache-dir -r requirement.txt

COPY /capital_agent /capital_agent/

COPY main.py ./

CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port $PORT"]
