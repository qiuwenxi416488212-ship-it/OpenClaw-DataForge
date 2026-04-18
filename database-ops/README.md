# Database Ops Skill

## 概述
SQLite/MySQL数据库操作工具，支持查询、插入、更新、删除、备份等。

## 安装
```bash
pip install pandas
# MySQL: pip install pymysql sqlalchemy
```

## 功能列表 (22个方法)

### 连接
- `connect()` - 连接数据库
- `close()` - 关闭连接
- `get_cursor()` - 获取游标(上下文管理器)

### 查询
- `execute(sql, params)` - 执行SQL
- `query(sql, params)` - 查询别名
- `fetch_one(sql, params)` - 获取单条
- `fetch_value(sql, params)` - 获取单个值

### 插入/更新/删除
- `insert(table, data)` - 插入单条
- `insert_many(table, rows)` - 批量插入
- `update(table, data, where, params)` - 更新
- `delete(table, where, params)` - 删除

### 表结构
- `get_tables()` - 获取所有表
- `get_table_info(table)` - 获取表结构
- `get_columns(table)` - 获取列名

### 统计
- `count(table, where)` - 统计行数
- `stats(table)` - 表统计信息

### 备份
- `backup(path)` - 备份数据库

### 事务
- `begin()` - 开始事务
- `commit()` - 提交事务
- `rollback()` - 回滚事务

### 便捷函数
- `sqlite_query(path, sql, params)` - 快速SQLite查询
- `sqlite_execute(path, sql, params)` - 快速SQLite执行
- `sqlite_backup(path, backup_path)` - 快速备份

### 数据导入导出
- `export_to_json(table, output_path)` - 导出到JSON
- `import_from_json(table, json_path)` - 从JSON导入

## 使用示例

### 基本连接
```python
from database_ops import DatabaseOps

# SQLite
db = DatabaseOps('data.db')

# MySQL (需配置)
# db = DatabaseOps('mysql://user:pass@localhost/dbname')
```

### 查询
```python
# 查询
results = db.execute('SELECT * FROM stocks LIMIT 10')

# 条件查询
results = db.execute(
    'SELECT * FROM stocks WHERE price > ?',
    (100,)
)

# 获取单条
stock = db.fetch_one('SELECT * FROM stocks WHERE code = ?', ('000001',))

# 获取单个值
count = db.fetch_value('SELECT COUNT(*) FROM stocks')
```

### 插入
```python
# 插入单条
db.insert('stocks', {
    'code': '000001',
    'name': '平安银行',
    'price': 12.34,
    'change_pct': 1.23
})

# 批量插入
db.insert_many('stocks', [
    {'code': '000001', 'price': 12.34},
    {'code': '000002', 'price': 56.78}
])
```

### 更新/删除
```python
# 更新
db.update('stocks', 
    {'price': 15.0},
    'code = ?',
    ('000001',))

# 删除
db.delete('stocks', 'code = ?', ('000001',))
```

### 统计
```python
# 行数
count = db.count('stocks')

# 表统计
stats = db.stats('stocks')
# {'table': 'stocks', 'columns': 5, 'rows': 1000, 'structure': [...]}
```

### 备份
```python
# 备份
backup_path = db.backup('backup_20260101.db')

# 或使用快速函数
backup_path = sqlite_backup('data.db', 'backup.db')
```

### 事务
```python
try:
    db.begin()
    db.insert('stocks', {...})
    db.insert('stocks', {...})
    db.commit()
except:
    db.rollback()
```

### 快速函数
```python
# 不需要创建对象
results = sqlite_query('data.db', 'SELECT * FROM stocks LIMIT 10')
sqlite_execute('data.db', 'DELETE FROM stocks WHERE old')
sqlite_backup('data.db', 'backup.db')
```

## 数据类型映射

| SQLite | Python |
|--------|--------|
| INTEGER | int |
| REAL | float |
| TEXT | str |
| BLOB | bytes |
| NULL | None |

## 注意事项

1. **写操作前备份** - 建议先备份
2. **使用参数化查询** - 防止SQL注入
3. **事务处理批量操作** - 保证一致性
4. **大数据量分批处理** - 避免内存问题

## 依赖
- pandas (可选)

## 许可证
MIT