package yourstay.md.service;

import java.util.List;

import yourstay.md.domain.Reservation;
import yourstay.md.domain.WishListVO;

public interface RoomHistoryService {
	public List<Reservation> getRoomList(long mseq);
	
	public List<Reservation> goReservationList(long mseq);
	
	public List<Reservation> goReservationRoom(long rid);
	
	public List<WishListVO> getWishList(long mseq);
}
