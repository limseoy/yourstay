package yourstay.md.mapper;

import java.util.List;

import yourstay.md.domain.Accommodation;
import yourstay.md.domain.resultVO;
import yourstay.md.domain.reviewVO;

public interface SearchMapper {
//	// CRUDs
//		public int addAccommodation(AccommodationVO accom);
//		public int removeAccommodation(int accommodationId);
//		public int updateAccommodation(AccommodationVO accom);
		public List<resultVO> getAccommodationByAccommodationId(long aid);
//		
//		// Functional Methods
//		public float getAveragePoint();
		public List<Accommodation> getAccommodationListBySearchBar(String aloc, String startdate, String deadline, int apeople);
		public List<reviewVO> getReviewByAccommodationId(long aid);
//		public List<AccommodationVO> getAccommodationListBySearchBarUsingFilter(String location, String startDate, String endDate,
//				int numberOfPeople, int startPrice, int endPrice);
//		public List<AccommodationVO> getAccommodationListBySearchBarUsingTypeFilter(String location, String startDate,
//				String endDate, int numberOfPeople, int totChecked);
//
//		public List<AccommodationVO> getAccommodationByHostId(String host_id);
//		public int checkLastAccomodationId();
}
