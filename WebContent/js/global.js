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

/*突出显示当前页面的导航栏*/
function highlightPage(){
	var div=document.getElementById("index");
	var ul=div.getElementsByTagName("ul");
	var links=ul[0].getElementsByTagName("a");
	var linkUrl;
	for(var i=0,len=links.length;i<len;i++){
		linkUrl=links[i].getAttribute("href");
		if(window.location.href.indexOf(linkUrl)!=-1){
			links[i].className="here"
		}
	}
}
addEvents(highlightPage);