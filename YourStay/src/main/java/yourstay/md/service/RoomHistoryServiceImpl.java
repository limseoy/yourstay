package yourstay.md.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import yourstay.md.domain.Reservation;
import yourstay.md.domain.WishListVO;
import yourstay.md.mapper.RoomHistoryMapper;
@Log4j
@Service
public class RoomHistoryServiceImpl implements RoomHistoryService {
	@Autowired
	RoomHistoryMapper mapper;
	@Override
	public List<Reservation> getRoomList(long mseq) {
		List<Reservation> vo = mapper.getRoomList(mseq);
		return vo;
	}
	@Override
	public List<Reservation> goReservationList(long mseq) {
		List<Reservation> vo = mapper.goReservationList(mseq);
		return vo;
	}
	@Override
	public List<Reservation> goReservationRoom(long rid) {
		log.error("RoomHistoryServiceImpl goReservationRoom rid:"+ rid);
		List<Reservation> vo = mapper.goReservationRoom(rid);
		return vo;
	}
	@Override
	   public List<WishListVO> getWishList(long mseq) {
	      List<WishListVO> vo = mapper.getWishList(mseq);
	      return vo;
	   }
}
