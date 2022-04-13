package yourstay.md.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import yourstay.md.domain.reviewVO;
import yourstay.md.domain.roomRegisterVO;

public interface FileService {
	public void write(reviewVO reviewVo, MultipartHttpServletRequest mpRequest) throws Exception;
	
}
