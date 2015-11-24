<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>首页</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--BASE STYLE-->
    <link rel="stylesheet" href="<%=basePath%>vendors/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>vendors/bootstrap/font-awesome.css">
    <link rel="stylesheet" href="<%=basePath%>vendors/antd/antd.css">
    <!--<link rel="stylesheet" href="http://127.0.0.1:3001/static/antd.css">  -->

    <link rel="stylesheet" type="text/css" href="static/dist/React-Components-0.1.1.min.css">

    <link rel="stylesheet" href="<%=basePath%>static/css/style.css">


    <!--[if lt IE 9]>
        <link rel="stylesheet" href="static/patch/antd-ie8-patch.css">
    <![endif]-->


    <!--[if IE 9]>
        <link rel="stylesheet" href="static/patch/antd-ie9-patch.css">
    <![endif]-->

</head>
<body>

<div id="dd-main-wrapper"> </div>


  <script type="text/javascript" src="<%=basePath%>vendors/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>vendors/JSXTransformer.js"></script>


  <!--路由配置-->
  <!--<script  type="text/javascript"  src="./webapp/config.js"></script>-->

  <!--组件库-->
  <!--<script type="text/javascript" src="http://127.0.0.1:3000/static/dd.js"></script>-->
  <script type="text/javascript" src="<%=basePath%>static/dist/React-Components-0.1.1.min.js"></script>



  <script type="text/jsx">

      var React = components.React;
      var Tools = components.tools;
      var Test = components.test.page1;
      var ECharts = components.echarts.ECharts;
      var WordCloud = components.echarts.WordCloud;
      var Page = components.pages.main.page1;


      var option = {
          title : {
              text: '未来一周气温变化',
              subtext: '纯属虚构'
          },
          tooltip : {
              trigger: 'axis'
          },
          legend: {
              data:['最高气温','最低气温']
          },
          toolbox: {
              show : true,
              feature : {
                  mark : {show: true},
                  dataView : {show: true, readOnly: false},
                  magicType : {show: true, type: ['line', 'bar']},
                  restore : {show: true},
                  saveAsImage : {show: true}
              }
          },
          calculable : true,
          xAxis : [
              {
                  type : 'category',
                  boundaryGap : false,
                  data : ['周一','周二','周三','周四','周五','周六','周日']
              }
          ],
          yAxis : [
              {
                  type : 'value',
                  axisLabel : {
                      formatter: '{value} °C'
                  }
              }
          ],
          series : [
              {
                  name:'最高气温',
                  type:'line',
                  data:[11, 11, 15, 13, 12, 13, 10],
                  markPoint : {
                      data : [
                          {type : 'max', name: '最大值'},
                          {type : 'min', name: '最小值'}
                      ]
                  },
                  markLine : {
                      data : [
                          {type : 'average', name: '平均值'}
                      ]
                  }
              },
              {
                  name:'最低气温',
                  type:'line',
                  data:[1, -2, 2, 5, 3, 2, 0],
                  markPoint : {
                      data : [
                          {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                      ]
                  },
                  markLine : {
                      data : [
                          {type : 'average', name : '平均值'}
                      ]
                  }
              }
          ]
      };

      var data1 = [
          {
              name: "Macys",
              value: 6181
          },
          {
              name: "Amy Schumer",
              value: 4386
          }
      ];


      var ThisPage = React.createClass({

          componentDidMount: function() {
              console.log("main.js loaded!!");
              Tools.handleA();
          },

          render: function(){
              return(<div>
                  <Page/>
                  <WordCloud data={data1} />
                  <WordCloud title="WordCloud" subtitle="WordCloud subtitile" height="800px" width="100%" theme="macarons" data={data1} />
                  <ECharts id="chart1" height="800px" width="100%" option={option}/>
              </div>);
          }
      });

      React.render(<ThisPage />, document.getElementById('dd-main-wrapper'));

  </script>

</body>
</html>
