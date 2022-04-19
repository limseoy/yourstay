package yourstay.md.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import yourstay.md.domain.Accommodation;
import yourstay.md.domain.WishListVO;
import yourstay.md.domain.reviewVO;

//@Mapper
public interface MyPageMapper {
	/*
	 * 회원의 찜정보뽑기
	 */
	public List<WishListVO> getWishAid(long mseq);
	/*
	 * 회원이 찜한 숙박업체 리스트
	 */
	public List<Accommodation> getWishList(List<WishListVO> wishlist);
	/*
	 * 회원이 찜한 숙박업체 등록
	 */
	public int addWishList(WishListVO wishListvo);
	/*
	 * 회원이 찜한 숙박업체 등록되었는지 검증! 
	 */
	public String findWishList(WishListVO wishListvo);
	/*
	 * 회원이 찜한 숙박업체 삭제
	 */
	public int deleteWishList(WishListVO wishListvo);
}
