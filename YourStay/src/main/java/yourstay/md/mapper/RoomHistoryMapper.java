package yourstay.md.mapper;

import java.util.List;

import yourstay.md.domain.Reservation;

public interface RoomHistoryMapper {
	public List<Reservation> getRoomList(long mseq);
}
