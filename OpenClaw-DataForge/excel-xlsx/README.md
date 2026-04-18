# Excel Parser Skill

## 概述
Microsoft Excel 工作簿操作工具，支持创建、读取、编辑Excel文件，处理公式、日期、格式、样式等。

## 安装
```bash
pip install openpyxl pandas
```

## 功能列表 (23个方法)

### 文件操作
- `load(path)` - 加载工作簿
- `save(path)` - 保存工作簿
- `close()` - 关闭工作簿
- `get_sheets()` - 获取所有Sheet名称
- `select_sheet(name)` - 选择Sheet
- `create_sheet(name)` - 创建Sheet
- `delete_sheet(name)` - 删除Sheet

### 数据读写
- `read_cell(cell)` - 读取单元格
- `read_range(range)` - 读取区域
- `read_all()` - 读取全部
- `write_cell(cell, value)` - 写入单元格
- `write_row(row, values)` - 写入行
- `write_range(start, data)` - 写入区域
- `append_row(values)` - 追加行
- `to_dataframe()` - 转为DataFrame

### 样式设置
- `set_style(range, **kwargs)` - 设置样式
- `set_column_width(col, width)` - 设置列宽
- `autofilter(range)` - 自动筛选

### 公式
- `write_formula(cell, formula)` - 写入公式
- `get_formula(cell)` - 获取公式

### 批量操作
- `create_template(path, sheets)` - 创建模板
- `merge_files(paths, output)` - 合并文件
- `split_by_column(input, output, col)` - 按列拆分

### 便捷函数
- `read_excel(path)` - 读取Excel
- `write_excel(data, path)` - 写入Excel
- `excel_to_csv(excel, csv)` - XLSX转CSV
- `csv_to_excel(csv, excel)` - CSV转XLSX

## 使用示例

### 基本使用
```python
from excel_parser import ExcelParser

# 加载并读取
parser = ExcelParser('data.xlsx')
df = parser.to_dataframe()
parser.close()

# 或使用便捷函数
df = read_excel('data.xlsx')
```

### 写入数据
```python
from excel_parser import ExcelParser

parser = ExcelParser('output.xlsx')

# 选择或创建Sheet
parser.create_sheet('Sales')

# 写入表头
parser.write_row(1, ['日期', '销售额', '利润'])

# 追加数据
parser.append_row(['2026-01', 1000, 200])
parser.append_row(['2026-02', 1500, 350])

parser.save()
parser.close()
```

### 批量转换
```python
from excel_parser import excel_to_csv, csv_to_excel

# XLSX转CSV
excel_to_csv('data.xlsx', 'data.csv')

# CSV转XLSX
csv_to_excel('data.csv', 'data.xlsx')
```

### 合并文件
```python
from excel_parser import ExcelParser

ExcelParser.merge_files(
    file_paths=['a.xlsx', 'b.xlsx', 'c.xlsx'],
    output_path='merged.xlsx'
)
```

### 创建模板
```python
from excel_parser import ExcelParser

ExcelParser.create_template(
    path='template.xlsx',
    sheets={
        'Sheet1': ['日期', '项目', '金额', '备注'],
        'Sheet2': ['姓名', '部门', '职位']
    }
)
```

## 依赖
- openpyxl
- pandas

## Excel规则要点

1. **选择正确的工作流程**
   - pandas: 分析、重塑、CSV类任务
   - openpyxl: 公式、样式、工作簿保留

2. **日期是序列数**
   - Excel存储为数字
   - 需要正确的数字格式显示

3. **保持计算在Excel中**
   - 使用公式而非硬编码值
   - 公式错误需在交付前检查

4. **保护数据类型**
   - 长ID、电话号码存储为文本
   - 精确度超过15位会截断

5. **交付前重新计算和检查**
   - 验证无 #REF!, #DIV/0! 等错误
   - 确认格式正确

## 许可证
MIT