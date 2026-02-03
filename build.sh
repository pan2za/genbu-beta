# 后台启动所有服务
docker compose up -d

# 查看服务运行状态
docker compose ps

# 查看某个组件的日志（如 grafana）
docker compose logs -f grafana

# .env 文件内容（替换为你的实际数据库信息，和 docker-compose 中的配置对应）
# 
export DATABASE_URL=postgres://genbu:strong_password@localhost:5432/genbu
# 1. 确保已安装 sqlx 命令行工具（若未安装）
cd genbu

cargo install sqlx-cli --no-default-features --features postgres

cd ..
# 2. 执行所有未执行的迁移（创建表结构）
sqlx migrate run

# 3. 验证：查看数据库中是否存在 upload_lease 和 file 表
#psql -h localhost -p 5432 -U genbu -d genbu -c "\dt"  # 列出所有表


start_collabora.sh

cargo build

export RUSTFLAGS="--cfg tokio_allow_from_blocking_fd"
# Access Key 对应 MinIO 用户名 minioadmin
export AWS_ACCESS_KEY_ID=minioadmin
# Secret Key 对应 MinIO 密码 minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
# （可选，若程序无法识别 MinIO 端点，补充导出端点环境变量）
export AWS_ENDPOINT_URL=http://localhost:9000

cargo run


# 创建 ./dist 目录
mkdir -p ./dist

cp index.html dist/

visit

http://localhost:8080


