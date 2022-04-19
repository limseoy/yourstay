package yourstay.md.service;

import static yourstay.md.domain.LoginConst.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.MemberVO;
import yourstay.md.mapper.MemberMapper;
@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	@Override
	public MemberVO getUser(String memail) {
		MemberVO memberVo = memberMapper.getUser(memail);
		return memberVo;
	}

	@Override
	public List<MemberVO> getUserList() {
		List<MemberVO> list = memberMapper.getUserList();
		return list;
	}

	@Override
	public int updateUser(MemberVO member) {
		int result = memberMapper.updateUser(member); 
		if(result>0) {
			log.info("## Service UpdateUser 성공!!");
		}else {
			log.info("## Service UpdateUser 실패!!");
		}
		return result;
	}

	@Override
	public int removeUser(String memail) {
		int result = memberMapper.removeUser(memail);
		if(result>0) {
			log.info("## Service removeUser 성공!!");
		}else {
			log.info("## Service removeUser 실패!!");
		}
		return result;
	}

	@Override
	public int login(String memail, String mpwd) {
		Map<String, String> parameters = new HashMap<>();
		parameters.put("memail", memail);
		parameters.put("mpwd", mpwd);
		
		MemberVO result = memberMapper.login(parameters);
		if(result == null) {
			return NO_ID;
		}else {
			String pwd = result.getMpwd();
			if(pwd != null) pwd = pwd.trim();
			
			if(!pwd.equals(mpwd)) {
				return NO_PWD;
			}else {
    			return YES_ID_PWD; //email과 pwd가 맞음 
    		}
		}
	}

}
