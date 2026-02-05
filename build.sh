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


sudo ./start_collabora.sh

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


1 register.html

# 2 接着用户登陆，记住登陆的cookie 
./login.sh

# 3  用户上传文档也需要通过swagger-ui，
生成上传凭据, 注意需要填写正确的文件大小。
./upload.sh
# 这里会生成 lease_id 和 uris

# 4 
上传文档
 步骤 1：提取 uris 中的上传链接
先复制 uris 数组中的唯一链接（注意：链接很长，要完整复制，不要遗漏任何字符）。
步骤 2：用 curl 向预签名链接发送 PUT 请求，上传文件

./userfiles.sh

#5 
上传结束
# lease id 
# SELECT * FROM "upload_lease" LIMIT ;

./upfinish.sh

# lease_id来自于upload.sh的结果
# etag 来自于userfiles.sh的结果
# upload_id来自于upload.sh的结果

# 查看上传结果

# SELECT * FROM FILE;
此时有保存的文件id，路径，创建者

# select * from access_token (目前仅仅另存为才有数据)

### 6 增加access token
insert into access_token (user_id, file_id, created_from) values (  'e4b9f5f6-da86-4252-8b50-1a04aa75bcae',  '45a97d5e-04af-48d9-92ff-e67df130ac19',  '127.0.0.1'::inet);

### 用户id和文件id来自于FILE表
insert into access_token (user_id, file_id, created_from) values (  'b9f03000-df79-4693-a056-e7a45f6519d2',  'f1f3d0c8-5757-42f6-b7b1-a8b3279f04ae',  '127.0.0.1'::inet);

SELECT * FROM  access_token;

查看token

UPDATE "file" SET size = 11894 WHERE id = 'f1f3d0c8-5757-42f6-b7b1-a8b3279f04ae' RETURNING *; 

### 7 修改index.html

# file_id 来自于SELECT * FROM FILE;

# access_token现在是空，无法查询到。需要修改,使用6的方法生成。

# 192.168.1.8 容器中访问8080,不能用localhost


