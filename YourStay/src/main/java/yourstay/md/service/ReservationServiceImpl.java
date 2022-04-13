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
	 * �������̺� ���
	 */
	@Override
	public void insertReservationS(Reservation reservationVO) {
		reservationMapper.insertReservation(reservationVO);
	}
	/*
	 * ���೯¥���̺� ���
	 */
	@Override
	public void insertReservationDateS(ReservationDateVO rdateVO) {
		reservationMapper.insertReservationDate(rdateVO);
	}
	/*
	 * ���೯¥���̺� ��ȸ
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
		if(checkList.size() != 0) { //����� �Է� ���� �������̺��� ������
			log.error("����Ұ��մϴ�");
		}else {
			//���డ��1
			log.error("���డ���մϴ�");
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