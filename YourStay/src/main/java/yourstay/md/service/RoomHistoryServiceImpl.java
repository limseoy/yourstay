package yourstay.md.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import yourstay.md.domain.Reservation;
import yourstay.md.mapper.RoomHistoryMapper;

@Service
public class RoomHistoryServiceImpl implements RoomHistoryService {
	@Autowired
	RoomHistoryMapper mapper;
	@Override
	public List<Reservation> getRoomList(long mseq) {
		List<Reservation> vo = mapper.getRoomList(mseq);
		return vo;
	}

}
