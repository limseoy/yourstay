package yourstay.md.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import yourstay.md.domain.Board;
import yourstay.md.domain.BoardVO;


public interface BoardMapper { 
	List<Board> selectPerPage(BoardVO boardVO); 
	Board selectBySeq(long boardnum);//content
	long selectCount();
	
	void insert(Board board);
	void update(Board board);
	void delete(long seq);
	Board selectBySeq2(long seq);
	List<Board> selectByName(String writer);
}
