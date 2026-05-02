# 🛡️ UHCC EP 2.214 Compliant Base Image
# Uses a minimal, secure, non-root base image suitable for HPC deployments
FROM python:3.13-slim-bullseye

# Set environment variables to ensure deterministic builds and secure execution
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1

# Install OS-level security updates and clean up in a single layer to reduce attack surface
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

# Create a dedicated, non-root user (UID 1000) for running the application
RUN useradd -m -s /bin/bash -u 1000 uhcc_runner

# Set the working directory
WORKDIR /app

# Copy dependency file and install python packages
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy application source code
COPY src/ ./src/

# Enforce strict ownership and permissions
RUN chown -R uhcc_runner:uhcc_runner /app && \
    chmod -R 750 /app

# Drop root privileges immediately
USER uhcc_runner

# Healthcheck to monitor internal API or inference service availability
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Start the secure inference wrapper
CMD ["python", "src/inference.py"]
