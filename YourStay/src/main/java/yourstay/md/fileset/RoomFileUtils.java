package yourstay.md.fileset;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import yourstay.md.domain.Accommodation;
import yourstay.md.domain.reviewVO;
import yourstay.md.domain.roomRegisterVO;

@Slf4j
@Component("roomFileUtils")
public class RoomFileUtils {
	public static final String FILE_STORE = "C:/seo/spring/sts-bundle/workspace/git/YourStay/src/main/webapp/resources/images/roomImg/";
	

	// 작성자별로 폴더 생성 하기 위한 메소드
	public static String writerPath(roomRegisterVO roomregisterVo) {
		final String FILE_FINAL_PATH = FILE_STORE + roomregisterVo.getAid() + "/";
		return FILE_FINAL_PATH;
	}

	public List<Map<String, Object>> parseInsertFileInfo(roomRegisterVO roomregisterVo,
			MultipartHttpServletRequest mpRequest) throws Exception {
		
		List<MultipartFile> fileList = mpRequest.getFiles("file");
//		Iterator<String> iterator = mpRequest.getFileNames();
//		log.error("RoomFileUtils내  // iterator : " + iterator);
//		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		long iid = roomregisterVo.getIid();
		long aid = roomregisterVo.getAid();

		File file = new File(writerPath(roomregisterVo));
		if (file.exists() == false) {
			file.mkdirs();
		}
		for(int i=0; i< fileList.size(); i++) {
			if (fileList.get(i).isEmpty() == false) {
				originalFileName = fileList.get(i).getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				file = new File(writerPath(roomregisterVo) + storedFileName);
				fileList.get(i).transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("iid", iid);
				listMap.put("org_file_name", originalFileName);
				listMap.put("stored_file_name", storedFileName);
				listMap.put("file_path", writerPath(roomregisterVo));
				listMap.put("aid", aid);
				list.add(listMap);
				log.error("RoomFileUtils내  // list : " + list);
			}
		}
		return list;

	}

	public static String getRandomString() {// 32글자의 랜덤한 문자열(숫자포함)을 만들어서 반환해주는 기능
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}