Tools = components.tools;

console.log("load router.js....")
if(window.location.pathname == "/login" || window.location.hash == '#/login'){
	window.location.hash = "#/login";
    console.log("����Login")
	//����URL���ز�ͬҵ��ҳ��
	Tools.goJSX("#/login");
}else{
    console.log("load base.jsx")
	//���ػ������
	Tools.loadScript("./static/pages/core/base.jsx");
	//����URL���ز�ͬҵ��ҳ��
	Tools.goJSX(window.location.hash);
}