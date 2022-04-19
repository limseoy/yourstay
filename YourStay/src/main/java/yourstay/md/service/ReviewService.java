package yourstay.md.service;

import java.util.List;
import java.util.Map;

import yourstay.md.domain.resultVO;
import yourstay.md.domain.reviewVO;

public interface ReviewService {
	public List<resultVO> getUser(String memail);
	
	public void insertFile(Map<String, Object> map) throws Exception;

	public void insert(reviewVO reviewVo);
	
	public resultVO select(long mseq);
}
