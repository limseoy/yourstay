package yourstay.md.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import yourstay.md.domain.Accommodation;
import yourstay.md.domain.MemberVO;
import yourstay.md.domain.WishListVO;
import yourstay.md.domain.reviewVO;
import yourstay.md.mapper.MemberMapper;
import yourstay.md.mapper.MyPageMapper;

@Log4j
@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	MyPageMapper myPageMapper;

	@Autowired
	SqlSession session;
	
	@Autowired
	MemberMapper memberMapper;

	/*
	 * 회원의 찜정보뽑기
	 */
	@Override
	public List<WishListVO> getWishAidS(long mseq) {
		return session.selectList("yourstay.md.mapper.MyPageMapper.getWishAid", mseq);
	}

	/*
	 * 회원이 찜한 숙박업체 리스트
	 */
	@Override
	public List<Accommodation> getWishListS(List<WishListVO> wishlist) {
		return session.selectList("yourstay.md.mapper.MyPageMapper.getWishList", wishlist);
	}
	
	/*
	 * 회원이 찜한 숙박업체 등록
	 */
	@Override
	public int addWishListS(WishListVO wishListvo) {
		//int result = session.insert("yourstay.md.mapper.MyPageMapper.addWish", reviewvo);
		log.error("#########MyPageServiceImpl addWishListS: "+wishListvo);
		
		log.info("service  - addWishList 완료");
		int result = myPageMapper.addWishList(wishListvo);
		if(result>0) {
			log.info("MyPageService addWishListS 회원등록 성공");
		}else {
			log.info("MyPageService addWishListS 회원등록 실패");
		}
		return result;
	}
	@Override
	public Map<String, List> getWishS(long mseq) {
		Map<String, List> wishMap = new HashMap<String, List>();

		List<WishListVO> wishList = myPageMapper.getWishAid(mseq);
		if (wishList.size() == 0) {
			return null;
		}

		List<Accommodation> accommoList = myPageMapper.getWishList(wishList);

		wishMap.put("wishList", wishList);
		wishMap.put("accommoList", accommoList);

		return wishMap;
	}
	/*
	 * 회원이 선택한 찜 리스트 한가지 선택하기 ! 
	 */
	@Override
	public boolean findWishListS(WishListVO wishListvo) {
		log.info("MyPageServiceImpl findWishList 찾기 성공! ");
		String result = myPageMapper.findWishList(wishListvo);
		return Boolean.parseBoolean(result);
	}
	/*
	* 회원이 찜한 List 찾기(선택하기)
	*/
	@Override
	public int deleteWishListS(WishListVO wishListvo) {
		log.info("MyPageServiceImpl deleteWishList 이동 ! ");
		int result = myPageMapper.deleteWishList(wishListvo);
		if(result>0) {
			log.info("MyPageServiceImpl deleteWishList 삭제 성공");
		}else{
			log.info("MyPageServiceImpl deleteWishList 삭제 실패");
		}
		return result;
	}
}
