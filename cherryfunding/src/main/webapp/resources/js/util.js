function comma(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}

function calDate(time){
	var elapsedTime = new Date(time);
	var mSec = Math.ceil((new Date() - elapsedTime) / 1000);
	var str = "";
	
	if(mSec > (60 * 60 * 24 * 30 * 12)){
		var minute = Math.ceil(mSec / 60);
		var hour = Math.ceil(minute / 60);
		var day = Math.ceil(hour / 24);
		var month = Math.ceil(day / 30);
		str += Math.ceil(month / 12) + "년";
	}else if(mSec > (60 * 60 * 24 * 30)){
		var minute = Math.ceil(mSec / 60);
		var hour = Math.ceil(minute / 60);
		var day = Math.ceil(hour / 24);
		str += Math.ceil(day / 30) + "개월";
	}else if(mSec > (60 * 60 * 24)){
		var minute = Math.ceil(mSec / 60);
		var hour = Math.ceil(minute / 60);
		str += Math.ceil(hour / 24) + "일";
	}else if(mSec > (60 * 60)){
		var minute = Math.ceil(mSec / 60);
		str += Math.ceil(minute / 60) + "시간";
	}else if(mSec > 60){
		str += Math.ceil(mSec / 60) + "분";
	}else{
		str += mSec + '초';
	}
	return str + ' 전';
}

function post(path, params, method) {
    method = method || "post";

    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
        }
    }

    document.body.appendChild(form);
    form.submit();
}

