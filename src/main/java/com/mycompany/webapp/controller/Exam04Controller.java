package com.mycompany.webapp.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.BoardsService;

@Controller
@RequestMapping("/exam04")
public class Exam04Controller {
	   private static final Logger logger =
		        LoggerFactory.getLogger(Exam04Controller.class);

   
   @Autowired
   private BoardsService boardsService;
   
   @Autowired
   private DataSource dataSource;
   
   
   @RequestMapping("/content")
   public String content(Model model){
      Connection conn = null;
      try {
         //커넥션 풀에서 커넥션 객체를 대여해 오기
         conn = dataSource.getConnection();
         model.addAttribute("connStatus", "성공");
      }catch(Exception e) {
         e.printStackTrace();
         model.addAttribute("connStatus", "실패");
      }finally {
         try {
            //커넥션 풀로 커넥션 객체를 반납하기
            conn.close();
         } catch(Exception e) {}
      }
      return "exam04/content";
   }
   
   /*@GetMapping("/list")
   public String getBoardList(Model model) {
     List<Board> list = boardsService.getBoardList();
     model.addAttribute("list",list);
     return "exam04/boardlist";
   }*/
   
   @GetMapping("/list")
   public String getBoardList(String pageNo, Model model, HttpSession session) {
	  
	  int intPageNo = 1;
	  if(pageNo == null) {
		  //세션에서 Pager를 찾고, 있으면 pageNo를 설정
		  Pager pager = (Pager) session.getAttribute("pager");
		  if(pager != null) {
			  intPageNo = pager.getPageNo();
		  } 
	  }else {
		  intPageNo = Integer.parseInt(pageNo);
	  }
	  
	   
      int totalRows = boardsService.getTotalRows();
      Pager pager = new Pager(6,5, totalRows, intPageNo);
      session.setAttribute("pager", pager);
      
      List<Board> list = boardsService.getBoardList(pager);
      model.addAttribute("list", list);
      model.addAttribute("pager", pager);
      return "exam04/boardlist";
   }
   
   @GetMapping("/createForm")
   public String insertForm(HttpSession session) {
	  String uid = (String) session.getAttribute("loginUid");
	  	if(uid ==null) {
	  		return "redirect:/exam07/loginForm";
	  	}else {
	  		return "exam04/createForm";	  	   
	  	}	  	
      }
   
   /* @PostMapping("/create")
    public String saveBoard(String btitle, String bcontent) {
      Board board = new Board();
      board.setBtitle(btitle);
      board.setBcontent(bcontent);
      board.setBwriter("user1");
      
      boardsService.saveBoard(board);
      
     return "redirect:/exam04/list";
    }*/
   
   @PostMapping("/create")
    public String saveBoard(Board board, HttpSession session) {
	  String uid = (String) session.getAttribute("loginUid");
	  if(uid ==null) {
		  return "redirect:/exam07/loginForm";
	  }else {
		  board.setBwriter(uid);
	      boardsService.saveBoard(board);
	     return "redirect:/exam04/list";
	  }      
    }
   
   @GetMapping("/read")
   public String read(int bno, Model model) {
      boardsService.addHitcount(bno);
      Board board = boardsService.getBoard(bno);
      model.addAttribute("board", board);
      return "exam04/read";
   }
   
   @GetMapping("/updateForm")
   public String updateForm(int bno, Model model) {
      Board board = boardsService.getBoard(bno);
      model.addAttribute("board", board);
      return "exam04/updateForm";
   }
   
   @PostMapping("/update")
    public String update(Board board) {
      boardsService.updateBoard(board);
     return "redirect:/exam04/list";
    }
   
   @GetMapping("/delete")
   public String delete(int bno) {
      boardsService.deleteBoard(bno);
      return "redirect:/exam04/list";
   }
   
   @GetMapping("/createFormWithAttach")
   public String createFormWithAttach(HttpSession session) {
	   String uid = (String) session.getAttribute("loginUid");
	  	if(uid ==null) {
	  		return "redirect:/exam07/loginForm";
	  	}else {
	      return "exam04/createFormWithAttach";
	   }
   }
   
   /*@PostMapping("/createWithAttach")
   public String createWithAttach(
         String btitle, String bcontent, MultipartFile battach) {
      logger.info(btitle);
      logger.info(bcontent);
      logger.info(battach.getOriginalFilename());
      logger.info(battach.getContentType());
      return "redirect:/exam04/list";
   }*/
   
   @PostMapping("/createWithAttach")
   public String createWithAttach(Board board) {
      MultipartFile battach = board.getBattach();
      if(!battach.isEmpty()) {
         board.setBattachoname(battach.getOriginalFilename());
         board.setBattachtype(battach.getContentType());
         String saveName = new Date().getTime() + "-" + board.getBattachoname();
         board.setBattachsname(saveName);
         
         File file = new File("D:/Projects/uploadfiles/" + board.getBattachsname());
         try {
            battach.transferTo(file);
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      
//      logger.info(board.getBtitle());
//      logger.info(board.getBcontent());
//      logger.info(board.getBattachoname());
//      logger.info(board.getBattachsname());
//      logger.info(board.getBattachtype());
      board.setBwriter("user1");
      boardsService.saveBoard(board);
      
      return "redirect:/exam04/list";
   }
   
   @GetMapping("/downloadAttach")
   public void downloadAttach(int bno, HttpServletResponse response) {
	   try {
		   Board board = boardsService.getBoard(bno);
		   //응답 HTTP 헤더에 저장될 바디의 타입
		   response.setContentType(board.getBattachtype());
		   
		   //응답 HTTP 헤더에 다운로드할 수 있도록 파일 이름을 지정
		   String originalName = board.getBattachoname();
		   //한글 파일일 경우, 깨짐 현상을 방지
		   originalName = new String(originalName.getBytes("UTF-8"),"ISO-8859-1");	
		   response.setHeader("Content-Disposition", "attachment; filename=\""+originalName+"\";");
		   
		   //응답 HTTP 바디로 이미지 데이터를 출력
		   InputStream is = new FileInputStream("D:/Projects/uploadfiles/"+board.getBattachsname());
		   OutputStream os = response.getOutputStream();
		   FileCopyUtils.copy(is, os);
		   os.flush();
		   is.close();
		   os.close();
		   
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
   }
}






