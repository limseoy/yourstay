package yourstay.md.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import yourstay.md.domain.Reservation;
import yourstay.md.domain.roomModifyVO;
import yourstay.md.domain.roomRegisterVO;
import yourstay.md.mapper.MyRoomMapper;

@Log4j
@Service
public class MyRoomServiceImpl implements MyRoomService {
	@Autowired
	MyRoomMapper mapper;
	@Override
	public List<Reservation> getMyRoomList(long mseq) {
		List<Reservation> vo = mapper.getMyRoomList(mseq);
		return vo;
	}
	@Override
	public List<roomRegisterVO> modifyMyRoom(long aid, long mseq) {
		System.out.println("#(1)MyRoomServiceImpl");
		roomModifyVO vo = new roomModifyVO(aid, mseq);
		List<roomRegisterVO> vo1 = mapper.modifyRoom(vo);
		System.out.println("#(3)MyRoomServiceImpl modifyMyRoom() vo: "+ vo1);
		return vo1;	
	}

}
