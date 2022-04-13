package yourstay.md.mapper;

import java.util.List;

import yourstay.md.domain.Accommodation;
import yourstay.md.domain.WishListVO;

public interface MyPageMapper {
	/*
	 * 회원의 찜정보뽑기
	 */
	public List<WishListVO> getWishAid(long mseq);
	/*
	 * 회원이 찜한 숙박업체 리스트
	 */
	public List<Accommodation> getWishList(List<WishListVO> wishlist);
}
