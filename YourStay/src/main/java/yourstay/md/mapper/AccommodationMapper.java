package yourstay.md.mapper;

import java.util.List;
import java.util.Map;

import yourstay.md.domain.Accommodation;
import yourstay.md.domain.Image;
import yourstay.md.domain.MemberVO;
import yourstay.md.domain.roomRegisterVO;

public interface AccommodationMapper {

   /*
    * 숙소 테이블에 등록
    */
   public void insertAccom(roomRegisterVO roomregisterVo);
   
   public void insertOption(roomRegisterVO roomregisterVo);
   public void insertUtil(roomRegisterVO roomregisterVo);
   /*
    * 이미지 테이블 등록
    */
   public void insertFile(Map<String, Object> map) throws Exception;
   /*
    * 숙소 테이블 수정
    */
   public void updateAccom(roomRegisterVO roomregisterVo);
   
   
   public void updateOption(roomRegisterVO roomregisterVo);
   public void updateUtil(roomRegisterVO roomregisterVo);
   public void updateFile(Map<String, Object> map) throws Exception;

   public void requestDelete(long aid);
   /*
    * 등록하는 회원번호 가져오기
    */
   public MemberVO getRegisterMemberSeq(long mseq);
   /*
    * 숙소이미지 불러오기
    */
   public List<Image> selectRoomImage(long aid);
}