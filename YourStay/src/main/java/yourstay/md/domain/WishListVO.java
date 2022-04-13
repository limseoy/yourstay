package yourstay.md.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WishListVO {
	private long wid;
	private long mseq;
	private long aid;
	
	private String aname;
	private int aprice; 
	private String aloc;
}
