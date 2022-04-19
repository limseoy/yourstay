package yourstay.md.service;

import java.util.List;
import java.util.Map;

import yourstay.md.domain.Accommodation;
import yourstay.md.domain.MemberVO;
import yourstay.md.domain.WishListVO;
import yourstay.md.domain.reviewVO;

public interface MyPageService {
	/*
	 * 회원의 찜정보 전체 List
	 */
	public List<WishListVO> getWishAidS(long mseq);
	/*
	 * 회원이 찜한 숙박업체 리스트
	 */
	public List<Accommodation> getWishListS(List<WishListVO> wishlist);
	/*
	 * 회원이 찜한 숙박업체 등록 기능
	 */
	public int addWishListS(WishListVO wishListvo);
	
	
	Map<String, List> getWishS(long mseq);
	/*
	* 회원이 찜한 List 찾기(선택하기)
	*/
	public boolean findWishListS(WishListVO wishListvo);
	/*
	* 회원이 찜한 List 삭제하기
	*/
	public int deleteWishListS(WishListVO wishListvo);
	
}
