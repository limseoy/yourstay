package yourstay.md.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import yourstay.md.dao.interfaces.AccommodationDAO;
import yourstay.md.domain.Accommodation;
@Primary
@Repository
public class AccommodationDAOImp implements AccommodationDAO {

	@Autowired
	SqlSession session;
	
//	@Override
//	public int addAccommodation(Accommodation accom) {
//		return session.insert("accommodationMapper.insertAccommodation", accom);
//	}
//
//	@Override
//	public int removeAccommodation(int accommodationId) {
//		return session.delete("accommodationMapper.deleteAccommodationByAccommodationId", accommodationId);
//	}
//
//	@Override
//	public int updateAccommodation(Accommodation accom) {
//		return session.update("accommodationMapper.updateAccommodation", accom);
//	}
//
//	@Override
//	public Accommodation getAccommodationByAccommodationId(int accommodationId) {
//		return session.selectOne("accommodationMapper.getAccommodationByAccommodationId", accommodationId);
//	}
//
//	@Override
//	public float getAveragePoint() {
//		// TODO Auto-generated method stub
//		return 0;
//	}

	@Override
	public List<Accommodation> getAccommodationListBySearchBar(String city, String startDate, String endDate,
			int p) {
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("city", city);
		parameters.put("startDate", startDate);
		parameters.put("endDate", endDate);
		parameters.put("person", p);
		
		return session.selectList("accommodationMapper.getAccommodationListBySearchBar", parameters);
	}
	
//	@Override
//	public List<Accommodation> getAccommodationListBySearchBarUsingFilter(String location, String startDate, String endDate,
//			int numberOfPeople, int startPrice, int endPrice) {
//		
//		Map<String, Object> parameters = new HashMap<>();
//		parameters.put("location", location);
//		parameters.put("startDate", startDate);
//		parameters.put("endDate", endDate);
//		parameters.put("numPeople", numberOfPeople);
//		parameters.put("startPrice", startPrice);
//		parameters.put("endPrice", endPrice);
//		
//		return session.selectList("accommodationMapper.getAccommodationListBySearchBarUsingPriceFilter", parameters);
//	}
	
	

//	@Override
//	public List<Accommodation> getAccommodationByHostId(String host_id) {
//		
//		return session.selectList("accommodationMapper.getAccommodationByHostId", host_id);
//	}
//
//	@Override
//	public int checkLastAccomodationId() {
//		return session.selectOne("accommodationMapper.checkAccomId");
//	}
//
//	@Override
//	public List<Accommodation> getAccommodationListBySearchBarUsingTypeFilter(String location, String startDate,
//			String endDate, int numberOfPeople, int totChecked) {
//		// TODO Auto-generated method stub
//		return null;
//	}
}
