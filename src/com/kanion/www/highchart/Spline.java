/**
* Filename: Spline.java
* Project Name: kanion
* @author: cyz	
* @version: 1.0
* @since: JDK 1.7.0_45
* Copyright © 2014 CCNT. All Rights Reserved
* Create at: 2015年5月20日  下午8:48:46
* Description:
*
* 
*/
package com.kanion.www.highchart;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * @ClassName: Spline
 * @Description: TODO
 * @date 2015年5月20日 下午8:48:46
 *
 */
public class Spline {
	
	private Chart chart=new Chart();;
	private Title title=new Title();
	private Subtitle subtitle=new Subtitle();
	private XAxis xAxis=new XAxis();
	private YAxis yAxis=new YAxis();
	private Tooltip tooltip=new Tooltip();
	private PlotOptions plotOptions=new PlotOptions();
	private List<Series> series=new ArrayList<Series>();
	
	//图标类型，默认为时间序列，且每条数据的时间可以不一样
	static class Chart{
		private String type="spline";
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
	}

	//图标主标题
	public static class Title{
		
		//标题文字文本
		private String text="";
		//标题位置，默认居中，X指偏离中心的大小
		private int x=0;
		//标题默认样式
		private Style style=new Style();
		public String getText() {
			return text;
		}
		public void setText(String text) {
			this.text = text;
		}
		public int getX() {
			return x;
		}
		public void setX(int x) {
			this.x = x;
		}
		public Style getStyle() {
			return style;
		}
		public void setStyle(Style style) {
			this.style = style;
		}	
		//标题样式：文字颜色、大小、字体
		static class Style{
			private String color="#64B9C9";
			private String fontSize="18px";
			private String fontFamily="微软雅黑";
			
			public String getColor() {
				return color;
			}

			public void setColor(String color) {
				this.color = color;
			}

			public String getFontSize() {
				return fontSize;
			}

			public void setFontSize(String fontSize) {
				this.fontSize = fontSize;
			}

			public String getFontFamily() {
				return fontFamily;
			}

			public void setFontFamily(String fontFamily) {
				this.fontFamily = fontFamily;
			}

			
		}
		
	}
	//图表副标题
	static class Subtitle{
		private String text="Source:www.kanion.com";
		private int x=0;
		public String getText() {
			return text;
		}
		public void setText(String text) {
			this.text = text;
		}
		public int getX() {
			return x;
		}
		public void setX(int x) {
			this.x = x;
		}
		
		
		
	}
	//X轴属性设置
	static class XAxis{
		private String type="datetime";
		
		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		
		
	}
	
	//Y轴属性
	static class YAxis{
		//Y轴标题
		private Title title=new Title();
		private int min=0;
		public Title getTitle() {
			return title;
		}

		public void setTitle(Title title) {
			this.title = title;
		}

		public int getMin() {
			return min;
		}

		public void setMin(int min) {
			this.min = min;
		}
		
	}
	//数据提示框
	static class Tooltip{
		//值的后缀
		private String valueSuffix="";

		public String getValueSuffix() {
			return valueSuffix;
		}

		public void setValueSuffix(String valueSuffix) {
			this.valueSuffix = valueSuffix;
		}
	}
	
	//时间间隔和起始时间
	static class PlotOptions{
		private InnerSpline spline=new InnerSpline();
		
		public InnerSpline getSpline() {
			return spline;
		}

		public void setSpline(InnerSpline spline) {
			this.spline = spline;
		}

		static class InnerSpline{
			private Marker maker=new Marker();
			//数据点间隔时间，默认1分钟
			private int pointInterval=60000;
			//数据点的起始时间
			@SuppressWarnings("deprecation")
			private long pointStart=Date.UTC(2015, 5, 1, 0, 0, 0);
			//线上是否显示数据点
			static class Marker{
				private boolean enabled=false;

				public boolean isEnabled() {
					return enabled;
				}

				public void setEnabled(boolean enabled) {
					this.enabled = enabled;
				}
				
			}
			public Marker getMaker() {
				return maker;
			}
			public void setMaker(Marker maker) {
				this.maker = maker;
			}
			public int getPointInterval() {
				return pointInterval;
			}
			public void setPointInterval(int pointInterval) {
				this.pointInterval = pointInterval;
			}
			public long getPointStart() {
				return pointStart;
			}
			public void setPointStart(long pointStart) {
				this.pointStart = pointStart;
			}
			
		}
	}
	
	//数据
	static class Series{
		//数据的含义，显示在图例上
		private String name="";
		//数据值数组
		private List<Object> data=new ArrayList<Object>();
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public List<Object> getData() {
			return data;
		}
		public void setData(List<Object> data) {
			this.data = data;
		}
		
	}
	
	
	
	
	
	public Chart getChart() {
		return chart;
	}



	public void setChart(Chart chart) {
		this.chart = chart;
	}



	public Title getTitle() {
		return title;
	}



	public void setTitle(Title title) {
		this.title = title;
	}



	public Subtitle getSubtitle() {
		return subtitle;
	}



	public void setSubtitle(Subtitle subtitle) {
		this.subtitle = subtitle;
	}



	public XAxis getxAxis() {
		return xAxis;
	}



	public void setxAxis(XAxis xAxis) {
		this.xAxis = xAxis;
	}



	public YAxis getyAxis() {
		return yAxis;
	}



	public void setyAxis(YAxis yAxis) {
		this.yAxis = yAxis;
	}



	public Tooltip getTooltip() {
		return tooltip;
	}



	public void setTooltip(Tooltip tooltip) {
		this.tooltip = tooltip;
	}




	public PlotOptions getPlotOptions() {
		return plotOptions;
	}



	public void setPlotOptions(PlotOptions plotOptions) {
		this.plotOptions = plotOptions;
	}



	public List<Series> getSeries() {
		return series;
	}



	public void setSeries(List<Series> series) {
		this.series = series;
	}
	
	

}
