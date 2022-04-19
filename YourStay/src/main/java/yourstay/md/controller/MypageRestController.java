package yourstay.md.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.MemberVO;
import yourstay.md.domain.WishListVO;
import yourstay.md.domain.roomRegisterVO;
import yourstay.md.service.AccommodationService;
import yourstay.md.service.MemberService;
import yourstay.md.service.MyPageService;


@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/mypage")
public class MypageRestController {
	@Autowired
	private AccommodationService accommodationService;
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private MemberService memberService;
	
	@PostMapping(value = "/register.do")
	   public ModelAndView roomRegister(ModelAndView mv, roomRegisterVO roomregisterVo,
	         MultipartHttpServletRequest mpRequest) throws Exception {
	      log.info("roomOption Data -> info 전달");
	      log.info("mpRequest : " +  mpRequest);
	      accommodationService.insertAccommodationS(roomregisterVo, mpRequest);
	      log.info("roomregisterVo: " + roomregisterVo);
	      mv.setViewName("redirect:/mypage/home");
	      return mv;
	   }
	@PostMapping(value = "/modifyRoom")
    public ModelAndView modifyRoom(ModelAndView mv, roomRegisterVO roomregisterVo,
      MultipartHttpServletRequest mpRequest) throws Exception {
      log.info("#modifyRoom 들어옴");
      log.info("#roomregisterVo aid: "+roomregisterVo.getAid());
      accommodationService.updateAccommodationS(roomregisterVo, mpRequest);
      log.info("roomregisterVo: " + roomregisterVo);
      mv.setViewName("redirect:/mypage/home");
      return mv;
   }
    @PostMapping(value = "/delete")
    public ModelAndView requestDelete(ModelAndView mv, Long aid){
    	log.info("[MypageController -> aid]: "+aid);
        log.info("[MypageController -> requestDelete 리스트 삭제 요청함]");
        accommodationService.requestDelete(aid);
        mv.setViewName("redirect:/mypage/home");
        return mv;
    }
    @PostMapping("updateUser.do")
	public ModelAndView updateMember(ModelAndView mv, long mseq, String mname, String memail, String mpwd, int mcallnum) {
        MemberVO member = new MemberVO(mseq, mname, memail, mpwd, mcallnum, 0);

		log.info("mseq getMseq 값 : " + member.getMseq()); // 여기까지 됨! 
		log.info("mseq getMname 값 : " + member.getMname());
		log.info("mseq getMemail 값 : " + member.getMemail());
		log.info("mseq getMpwd 값 : " + member.getMpwd());
		log.info("mseq getMcallnum 값 : " + member.getMcallnum());
		
		log.info("####memberVO : " + member);
	
		int updateResult = memberService.updateUser(member);
		log.info("11111111111111");
		if(updateResult>0) {
			log.info("Member Update 성공");
		}else {
			log.info("Member Update 실패");
		}
		mv.setViewName("redirect:/mypage/home");
		return mv;
	}
    @PostMapping("removeUser.do")
	public ModelAndView removeUser(ModelAndView mv, String memail, HttpSession session) {
		int result = memberService.removeUser(memail);
		if(result>0) {
			log.info("## Controller removeUser 성공!!");
			session.invalidate();
		}else {
			log.info("## Controller removeUser 실패!!");
		}
		mv.setViewName("redirect: /");
		return mv;
	}
	/*
	 * 찜하기 부분 추가 TEst
	 */	
	@ResponseBody
	@PostMapping(value="/wishlist/addwish")
	public String addWishList(HttpSession session, WishListVO wishlistvo) {
       log.info("!@@@@@@@@@wishlistvo : " + wishlistvo);
       boolean findResult = myPageService.findWishListS(wishlistvo);
       if(findResult) {
    	   myPageService.deleteWishListS(wishlistvo);
    	   log.info("## Controller deleteWishList 삭제 성공!!!!!!!!!!!!");
    	   return "deleteWishList";
       }else {
    	   myPageService.addWishListS(wishlistvo);
           log.info("## Controller wishlist 등록 성공");
           return "addWishListS";
       }
    }
}
