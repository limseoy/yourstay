package yourstay.md.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
   
   @RequestMapping("/")
   public String index() {
      
      return "index";
   }
   @RequestMapping("/chat")
   public String chat() {
      
      return "chat";
   }

   
//   @RequestMapping("/test")
//   public String index1() {
//      
//      return "roomsAdd";
//   }
   
}