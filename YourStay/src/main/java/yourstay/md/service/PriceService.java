package yourstay.md.service;

import yourstay.md.domain.resultVO;

public interface PriceService {
	/*
	 * 숙박일수 계산
	 */
	public long daysCalc(String rstart, String rend);
	/*
	 * 숙박일수에 따른 최종 금액 계산
	 */
	public long resultPrice(resultVO resVO, long diffDays);
}
