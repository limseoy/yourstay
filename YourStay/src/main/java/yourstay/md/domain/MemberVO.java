package yourstay.md.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private long mseq;
	private String mname;
	private String memail;
	private String mpwd;
	private int mcallnum;
	private int mstate;
	
	
	@Override
	public String toString() {
		return "MemberVO [memail=" + memail + ", mname=" + mname + ", mpwd=" + mpwd + "]";
	}
}
