# Feishu Sheets Skill

## 概述
飞书在线电子表格 (Sheets) 操作工具，支持创建、读取、写入、追加、管理Sheet。

## 安装
```bash
# 需要飞书应用权限
# 配置 channels.feishu
```

## 功能列表 (16个方法)

### Token处理
- `extract_token(url)` - 从URL提取spreadsheet_token
- `extract_sheet_id(url)` - 从URL提取sheet_id

### 请求构建
- `build_create_request(title)` - 创建表格请求
- `build_write_request(token, sheet_id, range, values)` - 写入请求
- `build_read_request(token, sheet_id, range)` - 读取请求
- `build_append_request(token, sheet_id, values)` - 追加请求
- `build_get_info_request(token)` - 获取信息请求
- `build_add_sheet_request(token, title)` - 添加Sheet请求
- `build_delete_sheet_request(token, sheet_id)` - 删除Sheet请求
- `build_insert_dimension_request(token, sheet_id, dim, start, end)` - 插入行/列请求
- `build_delete_dimension_request(token, sheet_id, dim, start, end)` - 删除行/列请求

### 数据类型
- `make_formula(text)` - 创建公式类型
- `make_link(text, url)` - 创建链接类型

### 便捷方法
- `write_single_value(token, sheet_id, row, col, value)` - 写入单个值

## 使用示例

### Token提取
```python
from feishu_sheets import FeishuSheets

# 从URL提取token
url = 'https://xxx.feishu.cn/sheets/shtABC123?sheet=0bxxxx'
token = FeishuSheets.extract_token(url)  # shtABC123
sheet_id = FeishuSheets.extract_sheet_id(url)  # 0bxxxx
```

### 构建请求
```python
from feishu_sheets import FeishuSheets

fs = FeishuSheets()

# 创建表格
req = fs.build_create_request('销售数据')

# 写入数据
req = fs.build_write_request(
    spreadsheet_token='shtABC123',
    sheet_id='0bxxxx',
    range='A1:C3',
    values=[
        ['日期', '销售额', '利润'],
        ['2026-01', 1000, 200],
        ['2026-02', 1500, 350]
    ]
)

# 追加数据
req = fs.build_append_request(
    spreadsheet_token='shtABC123',
    sheet_id='0bxxxx',
    values=[['2026-03', 1800, 420]]
)
```

### 特殊数据类型
```python
# 公式
formula = fs.make_formula('=SUM(A1:A10)')

# 链接
link = fs.make_link('点击查看', 'https://example.com')
```

## 范围格式

- 单个单元格: `A1`, `B5`
- 区域: `A1:C10`, `B2:D5`
- 整列: `A:A`, `B:D`
- 整行: `1:1`, `3:5`
- 带Sheet: `0bxxxx!A1:C10`

## 注意事项

1. 这是操作**在线电子表格**(Sheets)，不是多维表格(Bitable)
2. 需要飞书开放平台应用权限
3. 写入大量数据建议使用追加而非单次写入

## 依赖
- 无Python依赖（调用飞书API）

## 许可证
MIT