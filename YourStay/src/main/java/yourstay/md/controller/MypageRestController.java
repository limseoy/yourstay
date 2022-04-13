package yourstay.md.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.roomRegisterVO;
import yourstay.md.service.AccommodationService;


@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/mypage")
public class MypageRestController {
	@Autowired
	private AccommodationService accommodationService;
	
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
}
