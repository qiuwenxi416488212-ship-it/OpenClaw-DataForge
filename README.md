# OpenClaw-DataForge
一站式数据文件处理解决方案 | CSV/Excel/数据库/可视化工具套件  
解决: CSV乱码/JSON损坏/Excel问题/批量转换/数据清洗  
功能: 多格式解析/智能编码/自动修复/一键清洗/批量处理  
包含: Data Parser + Excel Parser + Database Ops + 可视化 + 飞书表格

技能套件完整介绍
这是什么?
OpenClaw 数据处理技能套件 = 5个专业工具,帮你搞定所有数据处理工作

🏆 技能1: Data Parser (数据解析器)
能做什么:

读取任意格式文件 (CSV/JSON/XLSX/Parquet/SQL)
自动检测编码,解决乱码
修复损坏的文件
一键清洗数据 (去重/过滤/类型推断)
批量转换格式
从网络URL读取
简单例子:

Copy
from data_parser import DataParser
parser = DataParser()
df = parser.parse("data.csv")  # 自动识别格式
df = parser.clean_pipeline("脏数据.csv")  # 一键清洗
🏆 技能2: Excel Parser (Excel工具)
能做什么:

读取/写入Excel
创建/删除Sheet
设置样式 (字体/颜色/边框)
支持公式
合并/拆分文件
简单例子:

Copy
from excel_parser import ExcelParser
parser = ExcelParser("报表.xlsx")
parser.write_row(1, ["日期", "金额"])
parser.append_row(["2026-01", 1000])
parser.save()
🏆 技能3: Database Ops (数据库工具)
能做什么:

操作SQLite (本地) 和 MySQL (远程)
查询/插入/更新/删除
批量操作
备份和恢复
事务处理
简单例子:

Copy
from database_ops import DatabaseOps
db = DatabaseOps("app.db")
db.insert("users", {"name": "张三", "age": 25})
users = db.execute("SELECT * FROM users")
🏆 技能4: Data Visualization (图表生成)
能做什么:

生成折线图/柱状图/饼图/散点图
保存为PNG/HTML
支持交互式图表 (Plotly)
简单例子:

Copy
from chart_generator import ChartGenerator
chart = ChartGenerator()
chart.line_chart(data, "月份", "销售")
chart.save("图表.png")
🏆 技能5: Feishu Sheets (飞书表格)

能做什么:
构建飞书表格请求
自动化数据同步
📦 安装
Copy
pip install pandas openpyxl chardet pyarrow xlrd matplotlib
📊 可以实现的目标
目标	使用技能
读取各种数据文件	Data Parser
处理乱码/损坏文件	Data Parser
一键清洗数据	Data Parser
批量转格式	Data Parser
制作Excel报表	Excel Parser
操作数据库	Database Ops
生成统计图表	Data Visualization
同步飞书数据	Feishu Sheets
这个技能套件可以满足你90%的数据处理需求! 

5个技能包总览
技能	Python文件	功能数	文件
data-parser	data_parser.py	49	完整文档+示例
excel-xlsx	excel_parser.py	23	完整文档+示例
feishu-sheets-skill	feishu_sheets.py	16	完整文档+示例
database-ops	database_ops.py + mysql_ops.py	25+	完整文档+示例
data-visualization	chart_generator.py	12+	完整文档+示例

每个技能包含
Copy
✅ SKILL.md          - OpenClaw技能定义
✅ README.md         - 英文文档
✅ README_CN.md      - 中文详细文档
✅ data_parser.py    - 主代码实现
✅ requirements.txt  - Python依赖
✅ LICENSE           - MIT开源许可

文档内容 (每个技能)
简介 - 解决什么问题
功能特性 - 表格展示
安装 - pip install 命令
快速开始 - 3行代码入门
详细示例 - 完整使用案例
API参考 - 所有方法说明
常见问题 - FAQ
许可证 - MIT







