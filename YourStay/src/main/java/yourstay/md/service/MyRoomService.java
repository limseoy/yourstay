package yourstay.md.service;

import java.util.List;

import yourstay.md.domain.Reservation;
import yourstay.md.domain.roomRegisterVO;

public interface MyRoomService {
	public List<Reservation> getMyRoomList(long mseq);
	
	public List<roomRegisterVO> modifyMyRoom(long aid,long mseq);
}
