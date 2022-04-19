package yourstay.md.service;

import java.util.List;

import yourstay.md.domain.MemberVO;

public interface MemberService {
	// CRUDs
		public MemberVO getUser(String memail);
		public List<MemberVO> getUserList();
		int updateUser(MemberVO member);
		int removeUser(String memail);
		
		// Functional Methods
		public int login(String memail, String mpwd);
}
