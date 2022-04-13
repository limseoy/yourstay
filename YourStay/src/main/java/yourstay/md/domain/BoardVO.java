package yourstay.md.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private int cp = 1;
	private int ps = 5;
	
	//private String subject = null;
	
	private int getStartRow() {
		return (cp-1)*ps;//ex) 0*5 = 0 
	}
	private int getEndRow() {
		return cp*ps;//ex) 1*5 = 5 
	}
	
//	private String getSubjectRow() {
//		return null;
//	}
}