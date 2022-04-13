package yourstay.md.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private long boardnum;
	private String category;
	private String subject;
	private String content;
	private Date rdate;
}
