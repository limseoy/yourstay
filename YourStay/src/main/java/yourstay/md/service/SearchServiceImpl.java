package yourstay.md.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.Accommodation;
import yourstay.md.domain.Reservation;
import yourstay.md.domain.ReservationCheck;
import yourstay.md.domain.resultVO;
import yourstay.md.domain.reviewVO;
import yourstay.md.mapper.SearchMapper;
@Log4j
@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService {
	@Autowired
	SearchMapper searchMapper;
	@Override
	public List<resultVO> getAccommodationByAccommodationId(long aid) {
		log.info("SearchMapperImpl  getAccommodationByAccommodationId aid : "+ aid);
		List<resultVO> vo = searchMapper.getAccommodationByAccommodationId(aid);
		return vo;
	}

	@Override
	public List<Accommodation> getAccommodationListBySearchBar(String aloc, String startdate, String deadline,
			int apeople) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("aloc", aloc);
		parameters.put("startdate", startdate);
		parameters.put("deadline", deadline);
		parameters.put("apeople", apeople);
		
		List<Accommodation> vo = searchMapper.getAccommodationListBySearchBar(parameters);
		return vo;
	}

	@Override
	public List<reviewVO> getReviewByAccommodationId(long aid) {
		log.info("SearchMapperImpl  getReviewByAccommodationId aid : "+ aid);
		List<reviewVO> vo = searchMapper.getReviewByAccommodationId(aid);
		return vo;
	}

	@Override
	public List<Accommodation> getAccommodationByLoc() {
		List<Accommodation> vo = searchMapper.getAccommodationByLoc();
		return vo;
	}

	@Override
	public List<Accommodation> getAccommodationListByLocation(String aloc) {
		List<Accommodation> vo = searchMapper.getAccommodationListByLocation(aloc);
		return vo;
	}

	@Override
	public long getCountGuest(long aid) {
		long vo = searchMapper.getCountGuest(aid);
		return vo;
	}

}
