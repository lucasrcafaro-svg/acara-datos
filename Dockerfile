FROM python:3.11-slim
WORKDIR /app
RUN pip install --no-cache-dir datasette datasette-vega datasette-dashboards
COPY acara.db .
COPY metadata.json .
COPY static/ ./static/
COPY templates/ ./templates/
ENV PORT=8080
CMD datasette acara.db \
    --metadata metadata.json \
    --static static:./static \
    --template-dir templates \
    --host 0.0.0.0 \
    --port $PORT
