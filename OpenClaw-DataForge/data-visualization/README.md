# Data Visualization Skill

## 概述
数据可视化工具，支持生成各类静态和交互式图表。

## 安装
```bash
pip install matplotlib pandas
# 交互式图表: pip install plotly
```

## 功能列表 (7+ 方法)

### Matplotlib图表
- `line_chart(data, x, y)` - 折线图
- `bar_chart(data, x, y)` - 柱状图
- `pie_chart(data, names, values)` - 饼图
- `scatter_chart(data, x, y)` - 散点图

### 保存/导出
- `save(path)` - 保存图表
- `to_base64()` - 转为Base64
- `show()` - 显示图表

### Plotly图表
- `PlotlyChart.line()` - 交互式折线图
- `PlotlyChart.bar()` - 交互式柱状图
- `PlotlyChart.scatter()` - 交互式散点图
- `PlotlyChart.pie()` - 交互式饼图
- `PlotlyChart.to_html()` - 转为HTML

### 便捷函数
- `quick_chart(data, type, x, y)` - 快速生成图表
- `chart_to_image(data, type, x, y, output)` - 生成并保存

## 使用示例

### 基本使用
```python
from chart_generator import ChartGenerator

# 数据
data = {
    'date': ['2026-01', '2026-02', '2026-03', '2026-04'],
    'sales': [1000, 1500, 1300, 1800],
    'profit': [200, 350, 250, 400]
}

# 生成图表
chart = ChartGenerator()
chart.line_chart(data, 'date', ['sales', 'profit'], title='Sales & Profit')
chart.save('chart.png')
```

### 快速图表
```python
from chart_generator import quick_chart

chart = quick_chart(data, 'line', 'date', 'sales')
chart.save('sales.png')
```

### 柱状图
```python
data = {
    'category': ['A', 'B', 'C', 'D'],
    'value': [100, 200, 150, 180]
}

chart = ChartGenerator()
chart.bar_chart(data, 'category', 'value', title='Category Value')
chart.save('bar.png')
```

### 饼图
```python
data = {
    'name': ['Product A', 'Product B', 'Product C'],
    'value': [35, 25, 40]
}

chart = ChartGenerator()
chart.pie_chart(data, 'name', 'value', title='Sales Distribution')
chart.save('pie.png')
```

### Plotly交互式图表
```python
import pandas as pd
from chart_generator import PlotlyChart

df = pd.DataFrame(data)

# 生成交互式图表
fig = PlotlyChart.line(df, 'date', 'sales', title='Sales')
html = PlotlyChart.to_html(fig)

# 保存
PlotlyChart.save(fig, 'chart.html')
```

### 批量生成
```python
from chart_generator import chart_to_image

data = {...}

# 生成多种图表
chart_to_image(data, 'line', 'date', 'sales', 'line.png')
chart_to_image(data, 'bar', 'category', 'value', 'bar.png')
```

## 图表类型

| 类型 | 适用场景 |
|------|----------|
| 折线图 | 趋势变化 |
| 柱状图 | 类别比较 |
| 饼图 | 占比分布 |
| 散点图 | 相关性 |

## 样式选项
```python
chart.line_chart(
    data, 'x', 'y',
    title='Title',
    xlabel='X Axis',
    ylabel='Y Axis',
    figsize=(12, 6)
)
```

## 注意事项
1. 中文字体需要在系统可用
2. 大数据量图表建议采样
3. 交互式图表可导出HTML

## 依赖
- matplotlib
- pandas
- plotly (可选)

## 许可证
MIT