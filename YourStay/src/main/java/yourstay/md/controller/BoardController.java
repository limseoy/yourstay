package yourstay.md.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.Board;
import yourstay.md.domain.BoardListResult;
import yourstay.md.service.BoardService;

@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("list")
	   public ModelAndView list(HttpServletRequest request, HttpSession session) {
	      String cpStr = request.getParameter("cp");
	      String psStr = request.getParameter("ps");
	      //(1) cp 
	      int cp = 1;
	      if(cpStr == null) {
	         Object cpObj = session.getAttribute("cp");
	         if(cpObj != null) {
	            cp = (Integer)cpObj;
	         }
	      }else {
	         cpStr = cpStr.trim();  
	         cp = Integer.parseInt(cpStr);
	      }
	      session.setAttribute("cp", cp);
	      //(2) ps 
	      int ps = 3;
	      if(psStr == null) {
	         Object psObj = session.getAttribute("ps");
	         if(psObj != null) {
	            ps = (Integer)psObj;
	         }
	      }else {
	         psStr = psStr.trim();
	         int psParam = Integer.parseInt(psStr);
	         
	         Object psObj = session.getAttribute("ps");
	         if(psObj != null) {
	            int psSession = (Integer)psObj;
	            if(psSession != psParam) {
	               cp = 1;
	               session.setAttribute("cp", cp);
	            }
	         }else {
	            if(ps != psParam) {
	               cp = 1;
	               session.setAttribute("cp", cp);
	            }
	         }
	         ps = psParam;
	      }
	      session.setAttribute("ps", ps);
	      //(3) ModelAndView 
	      BoardListResult listResult = boardService.getBoardListResult(cp, ps);
	      ModelAndView mv = new ModelAndView("board/list", "listResult", listResult);
	      
	      if(listResult.getList().size() == 0) {
	         if(cp > 1)
	            return new ModelAndView("redirect:list?cp="+(cp-1));
	         else 
	            return new ModelAndView("board/list", "listResult", null);
	      }else {
	         return mv;
	      }
	   }
	@GetMapping("content")
   public ModelAndView content(long boardnum) {
      Board board = boardService.getBoard(boardnum);
      ModelAndView mv = new ModelAndView("board/content", "board", board);
      
      return mv;
   }
	@GetMapping("write")
   public ModelAndView write() {
      ModelAndView mv = new ModelAndView("board/write");
      
      return mv;
   }
	@GetMapping("modify")
	   public ModelAndView modify(long boardnum) {
		  Board board = boardService.getBoard(boardnum);
	      ModelAndView mv = new ModelAndView("board/modify", "board", board);
	      
	      return mv;
	   }
}
