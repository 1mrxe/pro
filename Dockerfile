# لاتعبث بالملف دون فهم ، قد تحدث مشاكل انت في غنى عنها 
FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    gcc \
    python3-dev \
    libffi-dev \
    libssl-dev \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 user
USER user
ENV PATH="/home/user/.local/bin:$PATH"
WORKDIR /app

COPY --chown=user requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --upgrade -r requirements.txt


RUN pip install --no-cache-dir git+https://github.com/pytgcalls/pytgcalls.git@dev

COPY --chown=user . /app

CMD ["python3", "main.py"]
