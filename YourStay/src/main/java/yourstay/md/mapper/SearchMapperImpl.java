package yourstay.md.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import lombok.extern.log4j.Log4j;
import sun.util.logging.resources.logging;
import yourstay.md.domain.Accommodation;
import yourstay.md.domain.resultVO;
import yourstay.md.domain.reviewVO;
@Log4j
@Primary
@Repository
public class SearchMapperImpl implements SearchMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<Accommodation> getAccommodationListBySearchBar(String aloc, String startdate, String deadline,
		int apeople) {

		Map<String, Object> parameters = new HashMap<>();
		parameters.put("aloc", aloc);
		parameters.put("startdate", startdate);
		parameters.put("deadline", deadline);
		parameters.put("apeople", apeople);

		return session.selectList("yourstay.md.mapper.SearchMapper.getAccommodationListBySearchBar", parameters);
	}
	@Override
	public List<resultVO> getAccommodationByAccommodationId(long aid) {
		log.info("SearchMapperImpl  getAccommodationByAccommodationId aid : "+ aid);
		return session.selectList("yourstay.md.mapper.SearchMapper.getAccommodationByAccommodationId", aid);
	}
	@Override
	public List<reviewVO> getReviewByAccommodationId(long aid) {
		log.info("SearchMapperImpl  getReviewByAccommodationId aid : "+ aid);
		return session.selectList("yourstay.md.mapper.SearchMapper.getReviewByAccommodationId", aid);
	}
}
