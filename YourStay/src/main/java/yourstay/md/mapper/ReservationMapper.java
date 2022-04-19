package yourstay.md.mapper;

import java.util.List;

import yourstay.md.domain.Reservation;
import yourstay.md.domain.ReservationDateVO;

public interface ReservationMapper {
	/*
	 * 예약테이블 등록
	 */
	public void insertReservation(Reservation reservationVO);
	/*
	 * 예약날짜테이블 등록
	 */
	public void insertReservationDate(ReservationDateVO rdateVO);
	/*
	 * 예약날짜테이블 조회
	 */
	public List<ReservationDateVO> selectReservationDate(Reservation reservationVO);
	
	public Long checkView(long mseq);
	public List<ReservationDateVO> selectAidReservationDate(long aid);
}