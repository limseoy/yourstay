package yourstay.md.controller;

import static yourstay.md.domain.LoginConst.YES_ID_PWD;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.MemberVO;
import yourstay.md.mapper.MemberMapper;
import yourstay.md.mapper.SearchMapper;

@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/login")
public class LoginRestController {
	@Autowired
	MemberMapper mapper;
	
	@Autowired
	SearchMapper searchMapper;
	
	@PostMapping("loginCheck.do")
	private ModelAndView check(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ServletException, IOException {
//		log.info("loginCon check aid:" + aid + ", startDate : " + rstart + ", endDate : " + rend);
		String memail = request.getParameter("memail");
		String mpwd = request.getParameter("mpwd");
		ModelAndView mv = new ModelAndView();
		//유효성 검사(클라이언트측 View:js, 서버측 Controller:java)
		log.info("loginCon check //email: "+memail+", pwd: "+mpwd);
		int result = mapper.login(memail, mpwd);
		log.info("로그인 결과(3>성공) : " + result);		
		
		if(result == YES_ID_PWD) { //로그인 성공시
			log.info("로그인 성공");	
			MemberVO m = mapper.getUser(memail);
			session = request.getSession();
			mv.addObject("msg", "success");
			session.setAttribute("memail", m.getMemail());
			session.setAttribute("mseq", m.getMseq());
			session.setAttribute("loginOkUser", m);
			log.info("m: "+m);
		}
		mv = new ModelAndView("msg", "result", result);
		return mv;
	}
	@PostMapping("join.do")
	public ModelAndView join(@RequestParam String mname, String memail, String mpwd, int mcallnum) {
   
	   MemberVO memberVo = mapper.getUser(memail);
	   ModelAndView mav = new ModelAndView();
	   if(memberVo == null)
	   {
	    mapper.addUser(new MemberVO(-1, mname, memail, mpwd , mcallnum, -1));
		   mav.setViewName("login/loginPage");
	      mav.addObject("msg","success");
	      log.info("ddd");
	      return mav;
      }
      else
      {
         mav.setViewName("login/joinPage");
         mav.addObject("msg","fail");
         log.info("cccc");
         return mav;
      }
   }
}
