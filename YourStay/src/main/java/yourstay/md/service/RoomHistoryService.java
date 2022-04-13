package yourstay.md.service;

import java.util.List;

import yourstay.md.domain.Reservation;

public interface RoomHistoryService {
	public List<Reservation> getRoomList(long mseq);
}
