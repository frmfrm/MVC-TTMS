function ajax(obj){
    //做网络请求的时候,参数以"对象"的形式传递进来
    //规定: obj 里面包含属性: 
    //1.url 
    //2.type -- get 还是 post
    //3.data -- 前端给后端传递的参数(前端传递的时候,以"对象"的形式)
    //4.回调函数 -- success
    //5.回调函数 -- error
    var ajaxObj = null;
    if (window.XMLHttpRequest) {
    ajaxObj = new XMLHttpRequest();
    }else{
    ajaxObj = new ActiveObject("Microsoft.XMLHTTP");
    }
    //检测状态的变化
    ajaxObj.onreadystatechange = function(){
    if (ajaxObj.readyState == 4) {
    if (ajaxObj.status >= 200 && ajaxObj.status < 300 || ajaxObj.status == 304) {
    if (obj.success) {
    obj.success(JSON.parse(ajaxObj.responseText));
    }else{
    alert("您忘记了 success 函数");
    }    
    }else{
    if (obj.error) {
    obj.error(ajaxObj.status);
    }else{
    alert("您忘记了 error 函数");
    }
    }
    }
    }
    // type 转化为小写
    var type = obj.type || "get";
    type = type.toLowerCase();
    //判断是否传递了参数
    var params = "";
    if (obj.data) {
    for(var key in obj.data){
    params += (key + "=" + obj.data[key] + "&");
    }
    params = params.slice(0,params.length-1);
    }
    if (type == "get") {
    ajaxObj.open(type,obj.url+"?"+params,true);
    ajaxObj.send(null);
    }else{
    ajaxObj.open(type,obj.url,true);
    ajaxObj.setRequestHeader("Contesnt-Type","application/x-www-form-urlencoded");
    ajaxObj.send(params);
    }
    }