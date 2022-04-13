package yourstay.md.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class reviewVO {
	//review
	private long renum;
	private long aid;
	private long mseq;
	private int point;
	private String review;
	//review_file
	private long file_no;
	private String org_file_name;
	private String stored_file_name;
	private int file_size;
	//member
	private String mname;
	private String memail;
	private String mpwd;
	private int mcallnum;
	private int mstate;
}
