package yourstay.md.service;

import java.util.List;

import yourstay.md.domain.Reservation;
import yourstay.md.domain.ReservationDateVO;

public interface ReservationService {
	/*
	 * 예약테이블 등록
	 */
	public void insertReservationS(Reservation reservationVO);
	/*
	 * 예약날짜테이블 등록
	 */
	public void insertReservationDateS(ReservationDateVO rdateVO);
	/*
	 * 예약날짜테이블 조회
	 */
	public List<ReservationDateVO> selectReservationDateS(Reservation reservationVO);
	
	public void ReservationDateS(Reservation reservationVO);
}