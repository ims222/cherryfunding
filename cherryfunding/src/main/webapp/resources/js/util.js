function comma(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}