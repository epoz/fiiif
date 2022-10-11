
FROM python:3.9.7

RUN apt update && apt install -y libvips

RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY src /home/src
WORKDIR /home/src

CMD ["uvicorn", "--port", "8000", "--host", "0.0.0.0", "main:app"]