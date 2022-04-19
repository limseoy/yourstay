package yourstay.md.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.resultVO;
import yourstay.md.domain.reviewVO;
import yourstay.md.mapper.BoardMapper;
import yourstay.md.mapper.ReviewMapper;
@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewMapper reviewMapper;
	@Override
	public List<resultVO> getUser(String memail) {
		List<resultVO> vo = reviewMapper.getUser(memail);
		return vo;
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		reviewMapper.insertFile(map);

	}

	@Override
	public void insert(reviewVO reviewVo) {
		reviewMapper.insert(reviewVo);

	}

	@Override
	public resultVO select(long mseq) {
		resultVO vo = reviewMapper.select(mseq);
		return vo;
	}

}
