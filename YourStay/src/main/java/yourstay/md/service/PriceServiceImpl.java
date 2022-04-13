package yourstay.md.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import yourstay.md.domain.resultVO;
@Log4j
@Service
public class PriceServiceImpl implements PriceService {
	/*
	 * 숙박일수 계산
	 */
	@Override
	public long daysCalc(String rstart, String rend) {
		Date format1;
		Date format2;
		long diffSec = 0;
		long diffDays = 0;
		try {
			format1 = new SimpleDateFormat("yyyy-MM-dd").parse(rstart);
			format2 = new SimpleDateFormat("yyyy-MM-dd").parse(rend);
			diffSec = (format1.getTime() - format2.getTime()) / 1000; //초 차이
			diffDays = -1*(diffSec / (24 * 60 * 60)); // 일자수 차이
		} catch (ParseException e) {
			log.info("searchDetail // ParseException : " + e);
		}
		log.info(diffDays + "일 차이");
		return diffDays;
	}
	/*
	 * 숙박일수에 따른 최종 금액 계산
	 */
	@Override
	public long resultPrice(resultVO resVO, long diffDays) {
		long resultprice = diffDays * resVO.getAprice();
		log.info("최종 금액 : "+ resultprice + "원");
		return resultprice;
	}

}
