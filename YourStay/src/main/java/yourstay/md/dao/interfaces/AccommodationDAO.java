package yourstay.md.dao.interfaces;

import java.util.List;

import yourstay.md.domain.Accommodation;

public interface AccommodationDAO {
	// CRUDs
//	public int addAccommodation(Accommodation accom);
//	public int removeAccommodation(int accommodationId);
//	public int updateAccommodation(Accommodation accom);
//	public Accommodation getAccommodationByAccommodationId(int accommodationId);
	
	// Functional Methods
//	public float getAveragePoint();
	public List<Accommodation> getAccommodationListBySearchBar(String aloc, String startDate, String endDate, int apeople);
//
//	public List<Accommodation> getAccommodationListBySearchBarUsingFilter(String location, String startDate, String endDate,
//			int numberOfPeople, int startPrice, int endPrice);
//	public List<Accommodation> getAccommodationListBySearchBarUsingTypeFilter(String location, String startDate,
//			String endDate, int numberOfPeople, int totChecked);
//
//	public List<Accommodation> getAccommodationByHostId(String host_id);
//	public int checkLastAccomodationId();

}
