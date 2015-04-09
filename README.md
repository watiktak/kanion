kanion
======
Framework:springMVC3.2+spring3.2+mybatis3.1
------
#	1、图表导出功能
Highcharts提供将图表导出（或下载）为常见图片文件及打印图表功能。想要使用该功能，只需要引入exporting.js即可
<script src="js/modules/exporting.js"></script>
提示：exporting.js 存在于/highcharts-3.0.9/js/modules/目录下，如果不使用导出功能，不引入
exporting.js即可。引入exporting.js后，在图表即可看到导出功能。

#	2、图表主题
Highcharts提供图表更换主题功能，只需要引入主题js文件即可更换主题。除默认主题样式外，Highcharts官方提供5款可选主题，当然你也可以设计自己的图表主题。
Highcharts提供的主题文件存在/Highcharts-3.0.9/js/themes/目录下，例如给图表添加灰色（gray）主题的代码是
<script src="js/themes/gray.js"></script>

#	3、json返回注意事项
如果返回的json需要框架自动转化，则返回的json的请求链接不能以htm或html结尾。否则返回的内容当成html/text来处理，没有调用json，然后就抛这个异常。出现错误
“The resource identified by this request is only capable of generating responses with characteristics not acceptable according to the request "accept" headers ().”

#	4.mybatis自动生成错误
mybatis自动生成oracle中自有的表时，把scheme模式去掉就不会提示找不到相应表的问题。

#	5.mybatis的mapper中如果语句指定statementType="STATEMENT"则表示这条语句是非预编译的模式，此时可以动态传递表名和字段名，
否则经过预编译后表名和字段名不可更改，此外如果是非预编译的话，最好使用${}而不是#{}。$: 直接显示当前值，不会处理的。#：当成字符串处理

#	项目中的绝对路径包括:
*generatorDB.xml
	classPathEntry
*generatorConfig
	classPathEntry
*log4j.properties

