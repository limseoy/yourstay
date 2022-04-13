function daysPriceCalc() {
	console.log("daysPriceCalc funcion 시작");
	var sdd = document.getElementById("from").value;
	var edd = document.getElementById("to").value;
	var price = document.getElementById("rprice").value;
	console.log("가격: " + price);
	console.log("시작결과값: " + sdd + "/ 끝결과값: "+edd);
	var ar1 = sdd.split('-');
	var ar2 = edd.split('-');
	var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	var da2 = new Date(ar2[0], ar2[1], ar2[2]);
	var dif = da2 - da1;
	var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	if (sdd && edd) {
		var result = parseInt(dif / cDay); //숙박 수
		var resultprice = parseInt(price); //총 금액
		console.log("일수: " + result);
		console.log("1박가격: " + resultprice);
		console.log("계산결과값: " + result*resultprice);
		$('#days span').text(result+"박");//span에 숙박일수 입력
		$('#dayshidden').val(result); //input hidden으로  숙박일수 값넘기기
		$('#resultprice span').text(resultprice*result+"원");//span에 가격합계 입력
		$('#resultpricehidden').val(resultprice*result);//input hidden으로  가격합계  값넘기기
	}

}
