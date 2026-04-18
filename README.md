# OpenClaw-DataForge
## 一站式数据文件处理解决方案

<p align="center">
  <img src="https://img.shields.io/github/stars/XiLi/OpenClaw-DataForge" alt="Stars">
  <img src="https://img.shields.io/github/license/XiLi/OpenClaw-DataForge" alt="License">
  <img src="https://img.shields.io/pypi/pyversions/OpenClaw-DataForge" alt="Python">
</p>

---

## 📦 项目简介

**OpenClaw-DataForge** 是专为数据处理打造的专业工具套件。无论你是数据分析师、开发者还是普通用户，这个工具都能帮助你轻松应对各种数据文件难题。

> 解决数据处理中的各种烦心事，让数据工作变得更简单！

## 🎯 解决的核心痛点

| 痛点 | 解决方案 |
|------|----------|
| CSV文件打开乱码,不知道用什么编码? | 智能编码自动检测 |
| JSON文件损坏无法解析? | 自动修复损坏的JSON |
| Excel文件显示"文件损坏"? | 损坏检测+解决方案 |
| 批量转换文件格式太麻烦? | 文件夹批量一键转换 |
| 数据清洗太耗时? | 一键清洗pipeline |
| 大文件处理内存溢出? | 流式分块处理 |

---

## 🚀 快速开始

### 安装

```bash
# 基础安装
pip install pandas openpyxl chardet

# 完整安装 (推荐)
pip install pandas openpyxl chardet pyarrow xlrd matplotlib
```

### 3行代码入门

```python
from data_parser import DataParser

parser = DataParser()

# 自动识别格式并解析 (支持 CSV/JSON/XLSX/Parquet)
df = parser.parse("data.csv")

print(f"✅ 读取成功! 共 {len(df)} 行数据")
```

---

## 📂 包含的5个技能详解

### 1️⃣ Data Parser - 数据文件解析器

**数据文件解析器** 是整个套件的核心,专门处理各种数据文件的读取和转换。

#### 核心功能

| 功能 | 说明 |
|------|------|
| 🎯 **自动格式识别** | 自动识别 CSV/JSON/XLSX/XLS/Parquet/SQL |
| 🔍 **智能编码检测** | 自动检测 GBK/UTF-8/GB2312/Latin1 |
| 🔧 **损坏文件修复** | 自动修复损坏的JSON/XLSX文件 |
| 🧹 **一键数据清洗** | 去重/过滤空列/类型推断/列名标准化 |
| ⚡ **批量转换** | 文件夹内所有文件批量转格式 |
| 💾 **大文件流式处理** | 分块读取,不占内存 |
| 🌐 **URL直接读取** | 从网络URL直接解析数据 |
| 🔄 **重试机制** | 网络不稳定自动重试 |

#### 简单示例

```python
from data_parser import DataParser
parser = DataParser()

# 自动解析任意格式
df = parser.parse("data.csv")
data = parser.parse_json("data.json")
df = parser.parse_xlsx("data.xlsx")

# 一键清洗 (自动完成: 过滤表尾→删除空列→类型推断→去重)
df = parser.clean_pipeline("dirty_data.csv")

# XLSX转CSV (解决中文乱码)
parser.xlsx_to_csv("中文数据.xlsx", "data.csv")

# 批量转换整个文件夹
DataParser.convert_folder("D:/xlsx文件", "csv")

# 增量数据对比
new_records = parser.get_new_records("v1.csv", "v2.csv", key_columns=["id"])
```

---

### 2️⃣ Excel Parser - Excel操作工具

**Excel操作工具** 是专业的Microsoft Excel工作簿处理工具,帮助你创建、读取、编辑Excel文件。

#### 核心功能

| 功能 | 说明 |
|------|------|
| 📖 **完整读写** | 单元格/区域/整个工作簿 |
| 📑 **Sheet管理** | 创建/删除/选择/重命名Sheet |
| 🎨 **样式设置** | 字体/颜色/对齐/边框/背景 |
| 📐 **公式支持** | 读取和写入公式 |
| 🔄 **格式转换** | XLSX ↔ CSV |
| 📦 **批量操作** | 合并多个文件/按列拆分 |
| 🎯 **模板创建** | 快速生成标准模板 |

#### 简单示例

```python
from excel_parser import ExcelParser

# 读取Excel
parser = ExcelParser("销售数据.xlsx")
df = parser.to_dataframe()
print(f"读取 {len(df)} 行")

# 写入Excel
parser = ExcelParser("报表.xlsx")
parser.create_sheet("月度报告")

# 写入表头
parser.write_row(1, ["日期", "销售额", "利润", "备注"])

# 追加数据
parser.append_row(["2026-01", 10000, 2000, "开门红"])
parser.append_row(["2026-02", 15000, 3500, "增长"])
parser.append_row(["2026-03", 12000, 1800, "平稳"])

# 设置样式
from openpyxl.styles import Font, PatternFill
parser.set_style("A1:D1", 
    font=Font(bold=True),
    fill=PatternFill(start_color="CCE5FF", fill_type="solid")
)

parser.save()
parser.close()

# XLSX转CSV
excel_to_csv("中文数据.xlsx", "data.csv")

# 合并多个Excel
ExcelParser.merge_files(["a.xlsx", "b.xlsx"], "merged.xlsx")
```

---

### 3️⃣ Database Ops - 数据库工具

**数据库工具** 支持SQLite和MySQL,让数据库操作变得简单高效。

#### 核心功能

| 功能 | 说明 |
|------|------|
| 🗄️ **多数据库支持** | SQLite (本地) / MySQL (远程) |
| 📝 **完整SQL支持** | 查询/插入/更新/删除 |
| 🔄 **事务支持** | 开始/提交/回滚 |
| 💾 **备份恢复** | 数据库备份 |
| 📤 **数据导入导出** | JSON格式导入导出 |
| ⚡ **批量操作** | 批量插入 |
| 🔍 **智能查询** | 参数化查询防SQL注入 |

#### 简单示例

```python
from database_ops import DatabaseOps

# 连接SQLite (自动创建)
db = DatabaseOps("myapp.db")

# 创建表
db.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        age INTEGER,
        created_at TEXT
    )
''')

# 插入单条
db.insert("users", {
    "name": "张三",
    "email": "zhangsan@example.com",
    "age": 28,
    "created_at": "2026-01-01"
})

# 批量插入
users = [
    {"name": "李四", "email": "lisi@example.com", "age": 25},
    {"name": "王五", "email": "wangwu@example.com", "age": 30},
    {"name": "赵六", "email": "zhaoliu@example.com", "age": 27},
]
db.insert_many("users", users)

# 参数化查询 (防SQL注入)
results = db.execute(
    "SELECT * FROM users WHERE age > ? AND name LIKE ?",
    (25, "%张%")
)

# 获取单条
user = db.fetch_one("SELECT * FROM users WHERE id = ?", (1,))

# 获取单个值
count = db.fetch_value("SELECT COUNT(*) FROM users")

# 统计
total = db.count("users")
stats = db.stats("users")
print(f"表有 {stats['rows']} 行, {stats['columns']} 列")

# 事务处理
try:
    db.begin()
    db.insert("orders", {"user_id": 1, "amount": 100})
    db.insert("orders", {"user_id": 1, "amount": 200})
    db.commit()
    print("订单创建成功!")
except:
    db.rollback()
    print("已回滚")

# 备份
backup_path = db.backup("backup_20260101.db")

# 导出到JSON
from database_ops import export_to_json
export_to_json("myapp.db", "users", "users.json")

db.close()
```

#### MySQL支持

```python
from database_ops import MySQLConnection

# 连接MySQL
db = MySQLConnection(
    host="localhost",
    port=3306,
    user="root",
    password="password",
    database="myapp"
)

# 使用方法与SQLite相同
db.insert("users", {"name": "测试"})
results = db.execute("SELECT * FROM users")

db.close()
```

---

### 4️⃣ Data Visualization - 数据可视化

**数据可视化** 工具帮助你快速生成各类统计图表,支持静态和交互式图表。

#### 核心功能

| 功能 | 说明 |
|------|------|
| 📈 **折线图** | 趋势变化分析 |
| 📊 **柱状图** | 类别对比 |
| 🥧 **饼图** | 占比分布 |
| ⚪ **散点图** | 相关性分析 |
| 🎨 **样式定制** | 颜色/标签/图例/标题 |
| 💾 **多格式导出** | PNG/SVG/HTML |
| 📊 **交互式图表** | Plotly支持 (可选) |

#### 简单示例

```python
from chart_generator import ChartGenerator

# 准备数据
data = {
    "月份": ["1月", "2月", "3月", "4月"],
    "销售额": [10000, 15000, 12000, 18000],
    "利润": [2000, 3500, 2800, 4200]
}

# 折线图 - 趋势分析
chart = ChartGenerator()
chart.line_chart(
    data,
    x="月份",
    y=["销售额", "利润"],  # 多条线
    title="2026年月度销售趋势",
    xlabel="月份",
    ylabel="金额(元)"
)
chart.save("trend.png")

# 柱状图 - 类别对比
bar_data = {
    "产品": ["产品A", "产品B", "产品C", "产品D"],
    "销量": [1500, 2300, 1800, 2100],
    "目标": [2000, 2000, 2000, 2000]
}
chart.bar_chart(bar_data, "产品", ["销量", "目标"], title="产品销售 vs 目标")
chart.save("bar.png")

# 饼图 - 占比分析
pie_data = {
    "部门": ["销售部", "技术部", "财务部", "人事部"],
    "人数": [35, 30, 20, 15]
}
chart.pie_chart(pie_data, "部门", "人数", title="部门人员占比")
chart.save("pie.png")

# 散点图 - 相关性分析
scatter_data = {
    "广告投入": [100, 200, 300, 400, 500],
    "销售额": [1200, 1800, 2400, 2900, 3800]
}
chart.scatter_chart(scatter_data, "广告投入", "销售额", title="广告vs销售")
chart.save("scatter.png")

# 快速生成
from chart_generator import quick_chart
chart = quick_chart(data, "line", "月份", "销售额")
chart.save("quick.png")
```

#### Plotly 交互式图表

```python
import pandas as pd
from chart_generator import PlotlyChart

df = pd.DataFrame(data)

# 交互式折线图
fig = PlotlyChart.line(df, "月份", ["销售额", "利润"], title="交互式图表")
html = PlotlyChart.to_html(fig)

# 保存为HTML (可分享)
PlotlyChart.save(fig, "interactive.html")

# 保存为PNG
PlotlyChart.save(fig, "chart.png", format="png")
```

---

### 5️⃣ Feishu Sheets - 飞书表格

**飞书表格** 工具帮助你自动化操作飞书在线电子表格。

#### 核心功能

| 功能 | 说明 |
|------|------|
| 🔑 **Token提取** | 从URL提取表格ID |
| 📝 **请求构建** | 创建/读取/写入/追加请求 |
| 🔗 **数据类型** | 支持公式/链接 |

#### 简单示例

```python
from feishu_sheets import FeishuSheets

# 从URL提取Token
url = "https://xxx.feishu.cn/sheets/shtABC123?sheet=0bxxxx"
token = FeishuSheets.extract_token(url)     # shtABC123
sheet_id = FeishuSheets.extract_sheet_id(url)  # 0bxxxx

# 构建请求
fs = FeishuSheets()

# 创建表格
create_req = fs.build_create_request("销售数据表")

# 写入数据
write_req = fs.build_write_request(
    spreadsheet_token="shtABC123",
    sheet_id="0bxxxx",
    range="A1:C3",
    values=[
        ["日期", "销售额", "利润"],
        ["2026-01", 10000, 2000],
        ["2026-02", 15000, 3500]
    ]
)

# 追加数据
append_req = fs.build_append_request(
    spreadsheet_token="shtABC123",
    sheet_id="0bxxxx",
    values=[["2026-03", 12000, 1800]]
)

# 创建公式
formula = fs.make_formula("=SUM(A1:A10)")

# 创建链接
link = fs.make_link("点击查看", "https://example.com")
```

---

## 📊 功能对比表

| 功能 | Data Parser | Excel Parser | Database Ops | Visualization | Feishu |
|------|-------------|--------------|--------------|---------------|--------|
| CSV处理 | ✅ | ✅ | - | - | - |
| JSON处理 | ✅ | - | - | - | - |
| Excel处理 | ✅ | ✅ | - | - | - |
| 数据库 | - | - | ✅ | - | - |
| 图表生成 | - | - | - | ✅ | - |
| 数据清洗 | ✅ | - | - | - | - |
| 批量操作 | ✅ | ✅ | ✅ | - | - |
| 大文件 | ✅ | - | - | - | - |

---

## 📋 典型使用场景

### 场景1: 处理外部数据并存储

```python
from data_parser import DataParser
from database_ops import DatabaseOps

# 1. 从URL下载并解析CSV
parser = DataParser()
df = parser.parse_from_url("https://example.com/sales_data.csv")

# 2. 数据清洗
df = parser.clean_pipeline(df)

# 3. 存入数据库
db = DatabaseOps("sales.db")
db.insert_many("sales", df.to_dict('records'))

print(f"✅ 成功导入 {len(df)} 条数据")
```

### 场景2: 生成数据报表

```python
from database_ops import DatabaseOps
from chart_generator import ChartGenerator
from excel_parser import ExcelParser

# 1. 从数据库查询数据
db = DatabaseOps("sales.db")
data = db.execute("""
    SELECT DATE(created_at) as date, 
           SUM(amount) as sales 
    FROM orders 
    WHERE created_at >= '2026-01-01'
    GROUP BY DATE(created_at)
""")

# 2. 转换为DataFrame格式
chart_data = {"日期": [d["date"] for d in data], 
              "销售额": [d["sales"] for d in data]}

# 3. 生成图表
chart = ChartGenerator()
chart.line_chart(chart_data, "日期", "销售额", title="2026年销售趋势")
chart.save("sales_trend.png")

# 4. 导出Excel报表
ExcelParser.create_template("月报.xlsx", {
    "销售趋势": ["日期", "销售额"],
    "汇总": ["总销售额", "平均单量"]
})

print("✅ 报表生成完成")
```

### 场景3: 批量文件转换

```python
from data_parser import DataParser

# 将xlsx文件夹批量转为csv
DataParser.convert_folder(
    input_dir="D:/数据文件/xlsx",
    output_dir="D:/数据文件/csv",
    output_format="csv"
)

print("✅ 批量转换完成")
```

---

## 📦 依赖安装

```bash
# 基础依赖 (必须)
pip install pandas openpyxl chardet

# 完整依赖 (推荐)
pip install pandas openpyxl chardet pyarrow xlrd matplotlib

# 可选依赖
pip install plotly        # 交互式图表
pip install pymysql       # MySQL支持
```

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License - 免费商用

---

**如果对你有帮助,欢迎 ⭐ Star 支持!**

---

<div align="center">

Made with ❤️ by OpenClaw

</div>