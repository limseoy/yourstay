package yourstay.md.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.Accommodation;
import yourstay.md.domain.Image;
import yourstay.md.domain.MemberVO;
import yourstay.md.domain.Reservation;
import yourstay.md.domain.WishListVO;
import yourstay.md.domain.resultVO;
import yourstay.md.domain.reviewVO;
import yourstay.md.domain.roomRegisterVO;
import yourstay.md.mapper.MemberMapper;
import yourstay.md.mapper.ReviewMapper;
import yourstay.md.mapper.SearchMapper;
import yourstay.md.service.AccommodationService;
import yourstay.md.service.FileService;
import yourstay.md.service.MyPageService;
import yourstay.md.service.MyRoomService;
import yourstay.md.service.RoomHistoryService;

@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private AccommodationService accommodationService;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private RoomHistoryService roomService;
	@Autowired
	private MyRoomService myRoomService;
	@Autowired
	private SearchMapper seacrhmapper;
	
	
	@GetMapping(value="/home")
    public ModelAndView gohome(HttpSession session){
        log.info("MypageController -> gohome ��û");
        MemberVO vo = memberMapper.getUser((String)session.getAttribute("memail"));
        ModelAndView mv = new ModelAndView("mypage/home","member",vo);
        return mv;
    }
	
	@GetMapping(value = "/wishlist/{mseq}")
	public String wishlist(@PathVariable("mseq") long mseq, Model model) {
		log.info("MypageController -> wishlist ��û");
		Map<String, List> wishMap = myPageService.getWishS(mseq);

		model.addAttribute("wishMap", wishMap);

		return "mypage/wishlist";
	}
	@GetMapping(value="/roomHistory")
    public ModelAndView roomHistory(long mseq){
        log.info("MypageController -> roomHistory ��û");
        List<Reservation> vo = roomService.getRoomList(mseq);
        log.info("####vo:"+vo.toString());
    	for(Reservation ac: vo) {//���Ҹ���Ʈ �̹���	
			List<Image>roomImage = accommodationService.selectRoomImageS(ac.getAid());
			log.info("searchGetFromMain ///acvo.get("+ac+").getAid(): " + ac.getAid());
			log.info("searchGetFromMain ///roomImage: " + roomImage);
			log.info("searchGetFromMain ///roomImage.get(0).getStored_file_name() : " + roomImage.get(0).getStored_file_name());
			ac.setIpath1(roomImage.get(0).getStored_file_name());
		}	
    	ModelAndView mv = new ModelAndView("mypage/roomHistory","vo",vo);
        return mv;
    }
   @GetMapping(value="/review")
    public ModelAndView review(HttpSession session, @RequestParam long aid, @RequestParam long mseq) {
        log.info("aid : " + aid+ "// mseq:" + mseq);
        List<reviewVO> vo = reviewMapper.getUser((String) session.getAttribute("memail"));
        log.info("####vo:"+vo);
        reviewVO reviewvo = vo.get(0);
        reviewvo.setAid(aid); //������ ������ ���ҹ�ȣ �Է�
        ModelAndView mv = new ModelAndView("mypage/review","member",reviewvo);
        
        return mv;
    }
   
   @GetMapping(value="/roomReservation")
   public ModelAndView roomReservation(long mseq){
       log.info("MypageController -> roomReservation ��û");
       List<Reservation> vo = roomService.getRoomList(mseq);
      // List<Accommodation> acvo = seacrhmapper.getAccommodationListBySearchBar(mseq);
       log.info("####vo:"+vo.toString());
	   	for(Reservation ac: vo) {//���Ҹ���Ʈ �̹���	
			List<Image>roomImage = accommodationService.selectRoomImageS(ac.getAid());
			log.info("searchGetFromMain ///acvo.get("+ac+").getAid(): " + ac.getAid());
			log.info("searchGetFromMain ///roomImage: " + roomImage);
			log.info("searchGetFromMain ///roomImage.get(0).getStored_file_name() : " + roomImage.get(0).getStored_file_name());
			ac.setIpath1(roomImage.get(0).getStored_file_name());
		}
	   ModelAndView mv = new ModelAndView("mypage/roomReservation","vo",vo);
       return mv;
   }
   
   
   @GetMapping(value="/roomRegister")
   public ModelAndView roomRegister(@RequestParam long mseq) {
	   resultVO vo = reviewMapper.select(mseq);
	   log.info("MypageController -> roomRegister: "+ vo);
	   ModelAndView mv = new ModelAndView("room/roomRegister","vo",vo);
       return mv;
   }
   
   @GetMapping(value="/myRoom")
   public ModelAndView myRoom(@RequestParam long mseq) {
	   List<Reservation> reservation = myRoomService.getMyRoomList(mseq);
	   log.info("MypageController -> roomRegister: "+ reservation);
	   ModelAndView mv = new ModelAndView("mypage/myRoom","vo",reservation);
       return mv;
   }
   @GetMapping(value="/modifyRoom")
   public ModelAndView modifyRoom(@RequestParam long aid, @RequestParam long mseq) {
	   log.info("#(1)MypageController -> aid, mseq: "+ aid+" ,"+ mseq);
	   log.info("#(2)MypageController myRoomService : " + myRoomService);
	   List<roomRegisterVO> roomRegisterVO = myRoomService.modifyMyRoom(aid, mseq);
	   log.info("#(3)MypageController -> roomRegister: "+ roomRegisterVO.size());
	   
	   ModelAndView mv = new ModelAndView("mypage/modifyRoom","vo",roomRegisterVO);
	   
       return mv;
   }
}
