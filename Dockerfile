# Stage 1: Builder
FROM python:3.11-slim AS builder
WORKDIR /app

# Create a virtual environment
RUN python -m venv .venv
ENV PATH="/app/.venv/bin:$PATH"

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Final Image
FROM python:3.11-alpine
WORKDIR /app

# Copy the virtual environment from the builder stage
COPY --from=builder /app/.venv .venv
ENV PATH="/app/.venv/bin:$PATH"

# Copy the application code
COPY main.py .

# Expose the port and set entrypoint
EXPOSE 8088
RUN pip list
ENTRYPOINT ["python"]
CMD ["main.py"]
