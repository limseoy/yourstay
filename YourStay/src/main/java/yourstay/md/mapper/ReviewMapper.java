package yourstay.md.mapper;

import java.util.List;
import java.util.Map;

import yourstay.md.domain.resultVO;
import yourstay.md.domain.reviewVO;

public interface ReviewMapper {
	
	public List<reviewVO> getUser(String memail);
	
	public void insertFile(Map<String, Object> map) throws Exception;

	public void insert(reviewVO reviewVo);
	
	public resultVO select(long mseq);
}
