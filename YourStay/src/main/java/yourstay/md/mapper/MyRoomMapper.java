package yourstay.md.mapper;

import java.util.List;

import yourstay.md.domain.Reservation;
import yourstay.md.domain.roomModifyVO;
import yourstay.md.domain.roomRegisterVO;

public interface MyRoomMapper {
	public List<Reservation> getMyRoomList(long mseq);
	
	public List<roomRegisterVO> modifyRoom(roomModifyVO vo);
}
