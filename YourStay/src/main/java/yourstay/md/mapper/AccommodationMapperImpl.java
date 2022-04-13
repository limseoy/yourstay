package yourstay.md.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.slf4j.Slf4j;
import yourstay.md.domain.Accommodation;
import yourstay.md.domain.Image;
import yourstay.md.domain.MemberVO;
import yourstay.md.domain.roomRegisterVO;

@Slf4j
public class AccommodationMapperImpl implements AccommodationMapper {
   
   @Autowired
   SqlSession session;
   
   @Override
   public void insertAccom(roomRegisterVO roomregisterVo) {
      session.insert("yourstay.md.mapper.AccommodationMapper.insertAccom",roomregisterVo);

   }
   
   @Override
   public void insertOption(roomRegisterVO roomregisterVo) {
      session.insert("yourstay.md.mapper.AccommodationMapper.insertOption",roomregisterVo);

   }
   
   @Override
   public void insertUtil(roomRegisterVO roomregisterVo) {
      session.insert("yourstay.md.mapper.AccommodationMapper.insertUtil",roomregisterVo);

   }
   @Override
	public List<Image> selectRoomImage(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

   @Override
   public void insertFile(Map<String, Object> map) throws Exception {
      session.insert("yourstay.md.mapper.AccommodationMapper.insertFile", map);

   }

   @Override
   public MemberVO getRegisterMemberSeq(long mseq) {
      // TODO Auto-generated method stub
      return null;
   }

	@Override
	public void updateAccom(roomRegisterVO roomregisterVo) {
		log.error("#AccommodationMapperImpl roomregisterVo aid: "+roomregisterVo.getAid());
		session.update("yourstay.md.mapper.AccommodationMapper.updateAccom",roomregisterVo);
		log.error("#AccommodationMapperImpl roomregisterVo aid: "+roomregisterVo.getAid());
		
	}
	
	@Override
	public void updateOption(roomRegisterVO roomregisterVo) {
		session.update("yourstay.md.mapper.AccommodationMapper.updateOption",roomregisterVo);
		
	}
	
	@Override
	public void updateUtil(roomRegisterVO roomregisterVo) {
		session.update("yourstay.md.mapper.AccommodationMapper.updateUtil",roomregisterVo);
		
	}

	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		session.insert("yourstay.md.mapper.AccommodationMapper.updateFile", map);
		
	}

	@Override
	public void requestDelete(long aid) {
		session.delete("yourstay.md.mapper.AccommodationMapper.requestDelete", aid);
	}


}