function addEvents(func){
	var oldonload=window.onload;
	if(typeof window.onload!="function"){
		window.onload=func;
	}else{
		window.onload=function(){
			oldonload();
			func();
		}
	}
}


/*添加事件函数*/
var EventUtil={
		addHandler:function(element,type,handler){
			if(element.addEventListener){//DOM2级方法
				element.addEventListener(type,handler,false);
			}else if(element.attachEvent){//IE方法
				element.attachEvent("on"+type,handler);
			}else{//DOM0级方法
				element["on"+type]=handler;
			}
		},
		removeHandler:function(element,type,handler){
			if(element.removeEventListener,handler){
				element.removeEventListener(type,handler,false);
			}else if(element.detachEvent){
				element.detachEvent("on"+type,handler);
			}else{
				element["on"+type]=null;
			}
		}
}