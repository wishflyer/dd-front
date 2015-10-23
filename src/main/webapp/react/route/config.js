//注意, 这玩意从服务器读取也可以
Mimiron = components.Mimiron;
Tools = components.Tools;

//配置路由信息
Mimiron.RouteConfig = {
	"../js/pages/index.jsx":/^\/$/ig,
	"../js/pages/sample.jsx":/sample$/ig,
	"../js/pages/login.jsx":/login$/ig,
	"../js/pages/manage-report-group.jsx":/report\/manageReportGroup/ig,
	"../js/pages/report-manage.jsx":/report\/manage$/ig,
	"../js/pages/report-config.jsx":/report\/config/ig,
	"../js/pages/metadata.jsx":/report\/metadata/ig,
	"../js/pages/show-report.jsx":/showReport\/[^\/]*/ig,
	"../js/pages/resource.jsx":/resource\/[^\/]*/ig,
	"../js/pages/resource-detail.jsx":/resourceDetail\/[^\/]*/ig
}

Mimiron.debugMode = true;

if(window.location.pathname == "/login" || window.location.hash == '#/login'){
	//console.log("window.location.pathname == '/login' || window.location.hash == '#/login'");
	window.location.hash = "#/login";
	//根据URL加载不同业务页面
	Tools.goJSX("#/login");
}else{
	//加载BSS页面基本框架
	Tools.loadScript("../js/pages/base.jsx");
	//根据URL加载不同业务页面
	Tools.goJSX(window.location.hash);
}




