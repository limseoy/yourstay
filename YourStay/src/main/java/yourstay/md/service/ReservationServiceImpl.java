package yourstay.md.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import yourstay.md.domain.Reservation;
import yourstay.md.domain.ReservationDateVO;
import yourstay.md.mapper.ReservationMapper;
import yourstay.md.util.DateMaker;
@Service
@Slf4j
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	ReservationMapper reservationMapper;
	/*
	 * 예약테이블 등록
	 */
	@Override
	public void insertReservationS(Reservation reservationVO) {
		reservationMapper.insertReservation(reservationVO);
	}
	/*
	 * 예약날짜테이블 등록
	 */
	@Override
	public void insertReservationDateS(ReservationDateVO rdateVO) {
		reservationMapper.insertReservationDate(rdateVO);
	}
	/*
	 * 예약날짜테이블 조회
	 */
	@Override
	public List<ReservationDateVO> selectReservationDateS(Reservation reservationVO) {
		reservationMapper.selectReservationDate(reservationVO);
		return null;
	}
	@Override
	public void ReservationDateS(Reservation reservationVO) {
		ArrayList<String> selectDateList = (ArrayList<String>) DateMaker.getDateList(reservationVO.getRstart(), reservationVO.getRend());
		ArrayList<ReservationDateVO> checkList = (ArrayList<ReservationDateVO>) reservationMapper.selectReservationDate(reservationVO);
		ReservationDateVO rdateVO = new ReservationDateVO();
		if(checkList.size() != 0) { //사용자 입력 값이 예약테이블에 없으면
			log.error("예약불가합니다");
		}else {
			//예약가능1
			log.error("예약가능합니다");
			reservationMapper.insertReservation(reservationVO);
			rdateVO.setAid(reservationVO.getAid());
			rdateVO.setRid(reservationVO.getRid());
			for(int i = 0; i<selectDateList.size(); i++) {
				rdateVO.setRdate(selectDateList.get(i));
				reservationMapper.insertReservationDate(rdateVO);
			}
		}
	}

}