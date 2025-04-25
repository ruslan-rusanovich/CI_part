FROM python:3.12-alpine AS build


COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
ENV VIRTUAL_ENV=/app/venv \
    PATH="/app/venv/bin:$PATH"
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN uv venv venv
RUN uv pip install -r requirements.txt


FROM python:3.12-alpine
COPY --from=build /app/venv /app/venv
ENV PATH="/app/venv/bin:$PATH"
COPY . .
EXPOSE 8088
CMD ["python", "main.py"]