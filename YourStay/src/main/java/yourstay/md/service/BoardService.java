package yourstay.md.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import yourstay.md.domain.Board;
import yourstay.md.domain.BoardListResult;

public interface BoardService {
	
//	List<Board>selectPerPage(BoardVO boardVO);
	BoardListResult getBoardListResult(int cp, int ps);
	
//	Board selectBySeq(long seq);
	Board getBoard(long boardnum);
	
//	long selectCount();
	
//	void insert(Board board);
	void write(Board board);
	
//	void update(Board board);
	void edit(Board board);
	
//	void delete(long seq);
	void remove(long seq);
	
	Board selectBySeq2S(long seq);
	List<Board> selectByNameS(String writer);
}
