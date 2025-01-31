# ベースイメージ（コンテナ内環境）
FROM python:3.11-slim

# コンテナ内の作業ディレクトリ設定（/app/backend はコンテナ内のパス）
WORKDIR /app/backend

# 依存関係ファイルのみ先にコピー
COPY pyproject.toml uv.lock ./

# uvインストール
RUN pip install uv

# システム全体にインストールするよう明示
RUN uv pip install . --system

# 残りのファイルをコピー
COPY . .

# コンテナのネットワークポート公開設定
EXPOSE 8000

# コンテナ起動時に実行するコマンド（コンテナ内環境で実行）
CMD ["/bin/bash", "-c", "source .venv/bin/activate && uvicorn main:app --host 0.0.0.0 --port 8000"]