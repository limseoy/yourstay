package yourstay.md.mapper;

import java.util.List;
import java.util.Map;

import yourstay.md.domain.MemberVO;

public interface MemberMapper {
	// CRUDs
	public MemberVO getUser(String memail);
	public List<MemberVO> getUserList();
	public void addUser(MemberVO user);
	public int updateUser(MemberVO member);
	public int removeUser(String memail);
	
	// Functional Methods
	public MemberVO login(Map<String, String> parameters);
}
