package yourstay.md.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.Board;
import yourstay.md.domain.BoardListResult;
import yourstay.md.domain.BoardVO;
import yourstay.md.mapper.BoardMapper;
@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	private BoardMapper boardMapper;//Spring 4.3~: AutoInjection ( with @AllArgsConstructor )
	
	@Override
	public BoardListResult getBoardListResult(int cp, int ps) {
		long totalCount = boardMapper.selectCount();//?ñâ?ùò Í∞??àò (21)
		BoardVO boardVo = new BoardVO(cp, ps);//cp, psÍ∞? Î∞õÏïÑ?ò® Í∞íÏúºÎ°? ?Ñ∏?åÖ
		List<Board> list = boardMapper.selectPerPage(boardVo);
		
		return new BoardListResult(cp, totalCount, ps, list);
	}
	@Override
	public Board getBoard(long boardnum) {
		Board board = boardMapper.selectBySeq(boardnum);
		return board;
	}
	@Override
	public void write(Board board) {
		boardMapper.insert(board);
	}
	@Override
	public void edit(Board board) {
		boardMapper.update(board);
	}
	@Override
	public void remove(long seq) {
		boardMapper.delete(seq);
	}
	@Override
	public Board selectBySeq2S(long seq) {
		return boardMapper.selectBySeq2(seq);
	}

	@Override
	public List<Board> selectByNameS(String writer) {
		return boardMapper.selectByName(writer);
	}
}
