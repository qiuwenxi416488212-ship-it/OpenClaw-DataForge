# OpenClaw-DataForge

**一站式数据文件处理解决方案 | CSV/Excel/数据库/可视化工具套件**

---

## 📦 简介

OpenClaw-DataForge 是专为数据处理打造的专业工具套件。无论你是数据分析师、开发者还是普通用户，这个工具都能帮助你轻松应对各种数据文件难题。

## 🎯 解决什么问题?

你是否遇到过:

- 📄 CSV文件打开乱码,不知道用什么编码?
- 📋 JSON文件损坏无法解析?
- 📊 Excel文件显示"文件损坏"?
- 🔄 批量转换文件格式太麻烦?
- 🧹 数据清洗太耗时?

**OpenClaw-DataForge 帮你一键搞定!**

## ✨ 核心功能

| 功能 | 说明 |
|------|------|
| 📄 **多格式支持** | CSV, JSON, XLSX, XLS, Parquet, SQL |
| 🔍 **智能编码检测** | 自动识别 GBK/UTF-8/Latin1 |
| 🔧 **自动修复** | 修复损坏的JSON/XLSX文件 |
| 🧹 **一键清洗** | 去重/过滤空列/类型推断 |
| ⚡ **批量处理** | 文件夹批量转换 |
| 💾 **大文件流式处理** | 不占内存 |

## 🚀 快速开始

```bash
# 安装
pip install pandas openpyxl chardet pyarrow xlrd matplotlib
```

```python
from data_parser import DataParser

parser = DataParser()

# 自动解析任意格式
df = parser.parse("data.csv")

# 一键清洗
df = parser.clean_pipeline("dirty.csv")

# XLSX转CSV
parser.xlsx_to_csv("data.xlsx", "data.csv")
```

## 📂 包含技能

| 技能 | 功能 |
|------|------|
| **Data Parser** | 数据文件解析器 - 解析CSV/JSON/XLSX/Parquet/SQL |
| **Excel Parser** | Excel操作工具 - 读写/样式/公式 |
| **Database Ops** | 数据库工具 - SQLite/MySQL操作 |
| **Data Visualization** | 图表生成 - 折线图/柱状图/饼图/散点图 |
| **Feishu Sheets** | 飞书表格 - 请求构建/数据同步 |

## 📊 典型场景

### 场景1: 处理外部数据
```python
# 从URL下载并解析
df = parser.parse_from_url("https://example.com/data.csv")

# 一键清洗
df = parser.clean_pipeline(df)

# 存入数据库
db.insert_many("records", df.to_dict('records'))
```

### 场景2: 生成报表
```python
# 从数据库查询
data = db.execute("SELECT * FROM sales")

# 生成图表
chart.line_chart(data, 'date', 'amount')
chart.save('sales.png')

# 导出Excel
write_excel(data, 'report.xlsx')
```

## 📦 安装

```bash
# 基础安装
pip install pandas openpyxl chardet

# 完整安装 (推荐)
pip install pandas openpyxl chardet pyarrow xlrd matplotlib
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License - 免费商用

---

**如果对你有帮助,欢迎 ⭐ Star 支持!**