function openwindow(url, name, iWidth, iHeight) {
	var url; //转向网页的地址;
	var name; //网页名称，可为空;
	var iWidth; //弹出窗口的宽度;
	var iHeight; //弹出窗口的高度;
	var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
	//window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
	window.showModalDialog(url,null,"dialogWidth:350px;dialogHeight:100px;help:no;status:no"); 
}

function submit_form() {

	top.close();

}
function using(url){
	if (window.confirm("Are you sure ?")) {  
		window.location.href=url; 
	}else{  
		return false;  
	}
}