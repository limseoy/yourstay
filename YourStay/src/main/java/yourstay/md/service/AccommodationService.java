package yourstay.md.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import yourstay.md.domain.Accommodation;
import yourstay.md.domain.Image;
import yourstay.md.domain.MemberVO;
import yourstay.md.domain.roomRegisterVO;

public interface AccommodationService {
   /*
    * 숙소 테이블에 등록
    */
   public void insertAccommodationS(roomRegisterVO roomregisterVo, MultipartHttpServletRequest mpRequest) throws Exception;
   /*
    * 숙소 테이블 수정
    */
   public void updateAccommodationS(roomRegisterVO roomregisterVo, MultipartHttpServletRequest mpRequest) throws Exception;
   
   public void requestDelete(long aid);
   
   /*
    * 숙소이미지 가져오기
    */
   public List<Image> selectRoomImageS(long aid);
   /*
    * 등록하는 회원번호 가져오기
    */
   public MemberVO getRegisterMemberSeqS(long seq);
}